# 000_FSManageableResourceMaintenanceOperations.pdf

## Page 1

This protocol includes operations to check and format a resource for an FSUnaryFileSystem.
Conform to this protocol if you implement a FSUnaryFileSystem that uses an FSBlockDevic
Resource.
func startCheck(task: FSTask, options: FSTaskOptions) throws -> Progres
Starts checking the file system with the given options.
Required
func startFormat(task: FSTask, options: FSTaskOptions) throws ->
Progress
Starts formatting the file system with the given options.
Overview
Topics
Checking the file system
Formatting the file system
FSKit / FSManageableResourceMaintenanceOperations
Protocol
FSManageableResourceMaintenance
Operations
Maintenance operations for a file system’s resources.
macOS 15.4+


## Page 2

Required
NSObjectProtocol
Relationships
Inherits From


