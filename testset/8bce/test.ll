; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.acpi_device_info = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @acpi_get_object_info(%struct.acpi_device_info** %return_buffer) #0 {
entry:
  %retval = alloca i32, align 4
  %return_buffer.addr = alloca %struct.acpi_device_info**, align 8
  %info = alloca %struct.acpi_device_info*, align 8
  %valid = alloca i32, align 4
  store %struct.acpi_device_info** %return_buffer, %struct.acpi_device_info*** %return_buffer.addr, align 8
  %0 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8
  %tobool = icmp ne %struct.acpi_device_info** %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 4097, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call noalias i8* @malloc(i64 8) #2
  %1 = bitcast i8* %call to %struct.acpi_device_info*
  store %struct.acpi_device_info* %1, %struct.acpi_device_info** %info, align 8
  store i32 0, i32* %valid, align 4
  %2 = load i32, i32* %valid, align 4
  %3 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %valid1 = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %3, i32 0, i32 0
  store i32 %2, i32* %valid1, align 4
  %4 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %5 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8
  store %struct.acpi_device_info* %4, %struct.acpi_device_info** %5, align 8
  store i32 32, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xgene_ahci_probe() #0 {
entry:
  %version = alloca i32, align 4
  %status = alloca i32, align 4
  %info = alloca %struct.acpi_device_info*, align 8
  store i32 1, i32* %version, align 4
  %call = call i32 @acpi_get_object_info(%struct.acpi_device_info** %info)
  store i32 %call, i32* %status, align 4
  %0 = load i32, i32* %status, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %version, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8
  %valid = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %1, i32 0, i32 0
  %2 = load i32, i32* %valid, align 4
  %and = and i32 %2, 32
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 2, i32* %version, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i32, i32* %version, align 4
  ret i32 %3
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
