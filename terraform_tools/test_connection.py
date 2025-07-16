#!/usr/bin/env python3
import logging
import sys

# Configure logging: timestamp, level, filename, line number
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s [%(filename)s:%(lineno)d] %(message)s"
)

# Attempt to import the OpenStack SDK
try:
    from openstack import connection
    logging.info("OpenStack SDK imported successfully")
except ModuleNotFoundError as e:
    logging.error(f"OpenStack SDK is not installed: {e}")
    sys.exit(1)

def main():
    # Build the connection
    try:
        conn = connection.Connection(
            auth_url            = "https://os.vancouver-a.fortistack.corp.fortinet.com:5000/v3",
            project_name        = "FortiOS-Release-Automation",
            username            = "yzhengfeng",
            password            = "Ftnt123!",
            user_domain_name    = "Default",
            project_domain_name = "Default",
            identity_interface  = "public",     # Keystone via public endpoint
            interface           = "internal",   # Neutron/Nova via internal
            verify              = False         # skip SSL cert validation
        )
        logging.info("Connection object created successfully")
    except Exception:
        logging.exception("Failed to create connection to OpenStack")
        sys.exit(1)

    # Test listing networks
    try:
        logging.info("Testing conn.network.networks()")
        for net in conn.network.networks():
            logging.info(f"Found network: {net.name}")
    except Exception:
        logging.exception("Failed to list networks")

    # Test listing flavors
    try:
        logging.info("Testing conn.compute.flavors()")
        for flav in conn.compute.flavors():
            logging.info(f"Found flavor: {flav.name}")
    except Exception:
        logging.exception("Failed to list flavors")

if __name__ == "__main__":
    main()
