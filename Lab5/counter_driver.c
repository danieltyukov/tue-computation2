//////////////////////////////////////////////////////////////////////////////////
// Company: Eindhoven University of Technology
// Author: Wouter Schoenmakers & Robbert-Jan de Jager
// Modified by: Patrick Wijnings
// 
// Create Date: 24/02/2020
// Module Name: counter_driver.c
// Description: 5EIB0 lab 5 counter driver file without counter_read and counter_write. Can be given to students
// 
// Version: 1.5
//////////////////////////////////////////////////////////////////////////////////

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/device.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/moduleparam.h>
#include <linux/miscdevice.h>
#include <linux/uaccess.h>
#include <linux/ioctl.h>
#include <linux/slab.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Wouter Schoenmakers <w.e.schoenmakers@student.tue.nl> & Robbert-Jan de Jager <r.d.jager@student.tue.nl> & Patrick Wijnings <p.w.a.wijnings@tue.nl");
MODULE_DESCRIPTION("Driver for a simple counter build on the ZYNQ fpga");
MODULE_VERSION("1.1");

static const struct of_device_id counter_match[] = {
	{ .compatible = "tue,custom-counter-1.0", },
	{}
};

MODULE_DEVICE_TABLE(of, counter_match);

// Define a private structure
struct counter_private {
	struct miscdevice misc;
	struct resource res;
	struct device *dev;
	u32 __iomem *reg;
};

// Per file private structure
struct counter_file_private {
	struct counter_private *priv;
};

/**
 * This function is called when the module is loaded into the kernel.
 * It allocates memory for the private data structure in which the driver can store data that it needs to keep between calls.
 */
static int counter_open(struct inode *inode, struct file *file){
	struct miscdevice *mdev = file->private_data;
	struct counter_private *priv = container_of(mdev, struct counter_private, misc);

	struct counter_file_private *fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
	if(fpriv == NULL) {
		return -ENOMEM;
	}

	fpriv->priv = priv;
	file->private_data = fpriv;
	return 0;
}

/**
 * This function is called when the module is removed from the kernel. It frees the drivers private data.
 */
static int counter_release(struct inode *inode, struct file *file){
	kfree(file->private_data);
	file->private_data = NULL;
	return 0;
}

static ssize_t counter_read(struct file *file, char __user *buffer, size_t size, loff_t *offset){
	struct counter_file_private *fpriv = file->private_data;
	struct counter_private *priv = fpriv->priv;
	
	// TODO 1: 	Check whether "size" is equal to 16.
	//			Return '-EINVAL' if this is not the case.

	// TODO 2: 	Check whether "*offset" is equal to 0.
	//			Return '-EINVAL'  if this is not the case.

	// TODO 3:  Copy the values from the registers into "buffer".
    //          Use the function copy_to_user to do so.
    //          The variable "priv->reg" contains a pointer to the first register.
    //          Return "-EFAULT" if it failed.

	// TODO 4: Return the number of succesfully read bytes
}

static ssize_t counter_write(struct file *file, const char __user *buffer, size_t size, loff_t *offset){
	struct counter_file_private *fpriv = file->private_data;
	struct counter_private *priv = fpriv->priv;
    
    // TODO 1: 	Check whether "size" is equal to 16.
	//			Return '-EINVAL' if this is not the case.

	// TODO 2: 	Check whether "*offset" is equal to 0.
	//			Return '-EINVAL'  if this is not the case.

	// TODO 3:  Copy the values from "buffer" into the registers.
    //          Use the function copy_from_user to do so.
    //          The variable "priv->reg" contains a pointer to the first register.
    //          Return "-EFAULT" if it failed.

	// TODO 4: Return the number of succesfully written bytes
}

/**
 * This struct contains pointers to the functions that should be called by the kernel in case of different events.
 */
static const struct file_operations counter_fops = {
	.owner = THIS_MODULE,
	.read = counter_read,
	.write = counter_write,
	.open = counter_open,
	.release = counter_release
};

/**
 * This function is called when the kernel thinks it detected a piece of hardware that matches the driver.
 * It checks whether the device is correct and allocates memory at the hardware register locations.
 */
static int counter_probe(struct platform_device *pdev){
	struct counter_private *priv;
	const struct of_device_id *id;
	int result;
	
	printk(KERN_DEBUG "Counter driver is being probed");

	// Check if a device tree node is present
	if(!pdev->dev.of_node){
		return -ENODEV;
	}

	// Check if the node matches the compatible string
	id = of_match_node(counter_match, pdev->dev.of_node);
	if(!id){
		return -ENODEV;
	}

	// The node matched so lets allocate some memory for private data
	// This is a device managed function. So deallocation will be taken
	// care of by the device manager
	printk(KERN_DEBUG "Allocating memory for private structure");
	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
	if(!priv) {
		printk(KERN_ERR "Failed to allocate memory for private data: %d", result);
		return -ENOMEM;
	}

	priv->dev = get_device(&pdev->dev);

	// Set the private data to the device
	platform_set_drvdata(pdev, priv);
	
	printk(KERN_DEBUG "Loading resources");
	result = of_address_to_resource(pdev->dev.of_node, 0, &priv->res);
	if(result < 0){
		printk(KERN_ERR "Failed to load resources for counter device: %d", result);
		goto cleanup_dev;
	}
	
	printk(KERN_DEBUG "Requesting memory region");
	if(request_mem_region(priv->res.start, resource_size(&priv->res), "tue-counter") == NULL) {
		result = -ENOMEM;
		printk(KERN_ERR "Failed to request hardware memory for counter device: %d", result);
		goto cleanup_dev;
	}

	printk(KERN_DEBUG "Allocating memory region");
	priv->reg = of_iomap(pdev->dev.of_node, 0);
	if(priv->reg == NULL) {
		result = -ENOMEM;
		printk(KERN_ERR "Failed to map hardware memory for counter device: %d", result);
		goto cleanup_region;
	}

	priv->misc.name = "tue-counter";
	priv->misc.minor = MISC_DYNAMIC_MINOR;
	priv->misc.fops = &counter_fops;

	printk(KERN_DEBUG "Registering counter device");
	result = misc_register(&priv->misc);
	if(result) {
		printk(KERN_ERR "Could not initialize counter device: %d", result);
		goto cleanup_map;
	}

	printk(KERN_DEBUG "Succesfully registered counter device");
	return 0;

cleanup_map:
	iounmap(priv->reg);
cleanup_region:
	release_mem_region(priv->res.start,resource_size(&priv->res));
cleanup_dev:
	put_device(priv->dev);
	return result;
}

// This function is called when a device is removed. It frees all the used memory structures.
static int counter_remove(struct platform_device *pdev){
	struct counter_private *priv;

	// Retrieve the private data
	priv = platform_get_drvdata(pdev);
	if(!priv) {
		// No private data was registered so we are done
		return 0;
	}
	
	printk(KERN_DEBUG "Removing counter device");

	misc_deregister(&priv->misc);

	iounmap(priv->reg);

	release_mem_region(priv->res.start,resource_size(&priv->res));

	put_device(priv->dev);
	priv->dev = NULL;

	return 0;
}

static struct platform_driver counter_driver = {
	.driver = {
		.owner = THIS_MODULE,
		.name = "tue-counter",
		.of_match_table = counter_match,
	},
	.probe = counter_probe,
	.remove = counter_remove
};

module_platform_driver(counter_driver);
