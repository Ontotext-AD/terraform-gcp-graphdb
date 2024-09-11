VERSION := $(shell echo "var.source_image" | terraform console | grep -oP 'graphdb-\K[0-9]+-[0-9]+-[0-9]+')

# Name of the output zip file
ZIP_NAME := "graphdb-single-vm-deployment-package-${VERSION}.zip"

# Default target to create the zip
all: package

# Rule to create the zip file
package: clean
	zip -r $(ZIP_NAME) *.tf *.yaml LICENSE README.md

# Clean target to remove the zip file
clean:
	rm -f $(ZIP_NAME)
