#define AE_CODE_PROGRAMMER              0x1000	/* External ACPICA interface caller */
#define ACPI_FAILURE(a)  (a)
typedef int acpi_status;
#define EXCEP_PGM(code)                 ((acpi_status) (code | AE_CODE_PROGRAMMER))
#define AE_BAD_PARAMETER                EXCEP_PGM (0x0001)
#define ACPI_VALID_CID                  0x0020
#include <stdlib.h>
enum xgene_ahci_version {
	XGENE_AHCI_V1 = 1,
	XGENE_AHCI_V2,
};
struct acpi_device_info {
	int valid;		/* Indicates which optional fields are valid */
	int flags;
};
typedef void *acpi_handle;
acpi_status acpi_get_object_info(acpi_handle *handle, struct acpi_device_info **return_buffer){
	if (!handle || !return_buffer) {
		return (AE_BAD_PARAMETER);
	}
	struct acpi_device_info *info = malloc(sizeof(struct acpi_device_info));
	int valid = 0;
	info->valid = valid;
	*return_buffer = info;
	return ACPI_VALID_CID;
}
int xgene_ahci_probe(acpi_handle *handle){
	enum xgene_ahci_version version = XGENE_AHCI_V1;
	
	acpi_status status;
	struct acpi_device_info *info;

	status = acpi_get_object_info(handle, &info);
	if (ACPI_FAILURE(status)) {
		version = XGENE_AHCI_V1;
	}
	if (info->valid & ACPI_VALID_CID) {
	    version = XGENE_AHCI_V2;
	}
	return version;
}
