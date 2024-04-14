provider "aws" {                                 // This line declares the use of AWS (Amazon Web Services) as the provider for infrastructure management.
  region = "us-east-1"                          // Specifies the AWS region where resources will be created, in this case, 'us-east-1'.
}

// Below we define a resource, which is a component of your infrastructure that will be managed by Terraform.

resource "aws_lightsail_instance" "my_wordpress_instance" { // This line starts the definition of a resource of type 'aws_lightsail_instance' with the name 'my_wordpress_instance'.
  name              = "MyWordPressInstance"                  // Sets the name of the Lightsail instance to "MyWordPressInstance".
  availability_zone = "us-east-1a"                           // Specifies the availability zone within the AWS region where the instance will be created.
  blueprint_id      = "wordpress"                            // Defines the blueprint of the instance, in this case, a pre-configured WordPress environment.
  bundle_id         = "nano_2_0"                             // Determines the bundle (pricing and performance package) for the instance, here it's "nano_2_0".

  // Tags are key-value pairs that help in managing, sorting, and organizing resources.
  tags = {                                                   
    Name = "MyWordPressInstance"                             // Assigns a tag with key 'Name' and value 'MyWordPressInstance' to the resource.
  }
}

// This block defines an output value that can be queried or displayed after the Terraform configuration is applied.

output "wordpress_instance_public_ip" {            // Declares an output named 'wordpress_instance_public_ip'.
  value       = aws_lightsail_instance.my_wordpress_instance.public_ip_address // Sets the value of the output to the public IP address of the created Lightsail instance.
  description = "The public IP address of the WordPress Lightsail instance."   // Provides a human-readable description of what the output represents.
}
