; ModuleID = 'test.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/8bce/test.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.acpi_device_info = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @acpi_get_object_info(%struct.acpi_device_info** %return_buffer) #0 {
test.bc-acpi_get_object_info-0:
  %0 = alloca i32, align 4
  %1 = alloca %struct.acpi_device_info**, align 8
  %info = alloca %struct.acpi_device_info*, align 8
  %valid = alloca i32, align 4
  store %struct.acpi_device_info** %return_buffer, %struct.acpi_device_info*** %1, align 8
  %2 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %1, align 8
  %3 = icmp ne %struct.acpi_device_info** %2, null
  br i1 %3, label %test.bc-acpi_get_object_info-2, label %test.bc-acpi_get_object_info-1

test.bc-acpi_get_object_info-1:                   ; preds = %test.bc-acpi_get_object_info-0
  store i32 4097, i32* %0, align 4
  br label %test.bc-acpi_get_object_info-3

test.bc-acpi_get_object_info-2:                   ; preds = %test.bc-acpi_get_object_info-0
  %4 = call i8* @malloc(i64 4)
  %5 = bitcast i8* %4 to %struct.acpi_device_info*
  store %struct.acpi_device_info* %5, %struct.acpi_device_info** %info, align 8
  store i32 0, i32* %valid, align 4
  %6 = load i32, i32* %valid, align 4
  %7 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %8 = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %7, i32 0, i32 0
  store i32 %6, i32* %8, align 4
  %9 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %10 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %1, align 8
  store %struct.acpi_device_info* %9, %struct.acpi_device_info** %10, align 8
  store i32 32, i32* %0, align 4
  br label %test.bc-acpi_get_object_info-3

test.bc-acpi_get_object_info-3:                   ; preds = %test.bc-acpi_get_object_info-2, %test.bc-acpi_get_object_info-1
  %11 = load i32, i32* %0, align 4
  ret i32 %11
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @xgene_ahci_probe() #0 {
test.bc-xgene_ahci_probe-0:
  %version = alloca i32, align 4
  %status = alloca i32, align 4
  %info = alloca %struct.acpi_device_info*, align 8
  store i32 1, i32* %version, align 4
  %0 = call i32 @acpi_get_object_info(%struct.acpi_device_info** %info)
  store i32 %0, i32* %status, align 4
  %1 = load i32, i32* %status, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %test.bc-xgene_ahci_probe-1, label %test.bc-xgene_ahci_probe-2

test.bc-xgene_ahci_probe-1:                       ; preds = %test.bc-xgene_ahci_probe-0
  store i32 1, i32* %version, align 4
  br label %test.bc-xgene_ahci_probe-2

test.bc-xgene_ahci_probe-2:                       ; preds = %test.bc-xgene_ahci_probe-1, %test.bc-xgene_ahci_probe-0
  %3 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %4 = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = and i32 %5, 32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %test.bc-xgene_ahci_probe-3, label %test.bc-xgene_ahci_probe-4

test.bc-xgene_ahci_probe-3:                       ; preds = %test.bc-xgene_ahci_probe-2
  store i32 2, i32* %version, align 4
  br label %test.bc-xgene_ahci_probe-4

test.bc-xgene_ahci_probe-4:                       ; preds = %test.bc-xgene_ahci_probe-3, %test.bc-xgene_ahci_probe-2
  %8 = load i32, i32* %version, align 4
  ret i32 %8
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
