; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.power_supply = type { i8*, %struct.device }
%struct.device = type { %struct.device*, %struct.kobject }
%struct.kobject = type { i8*, %struct.kref, %struct.delayed_work, i8 }
%struct.kref = type { %struct.refcount_struct }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.atomic_t = type { i32 }
%struct.delayed_work = type { i32 }

@a = global i32 1, align 4
@init = common global %struct.power_supply zeroinitializer, align 8

; Function Attrs: noinline nounwind optnone uwtable
define i32 @refcount_dec_and_test(%struct.refcount_struct*) #0 {
  %2 = alloca %struct.refcount_struct*, align 8
  store %struct.refcount_struct* %0, %struct.refcount_struct** %2, align 8
  %3 = load %struct.refcount_struct*, %struct.refcount_struct** %2, align 8
  %4 = getelementptr inbounds %struct.refcount_struct, %struct.refcount_struct* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.atomic_t, %struct.atomic_t* %4, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %1
  br label %9

; <label>:9:                                      ; preds = %8, %1
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define void @kobject_put(%struct.kobject*) #0 {
  %2 = alloca %struct.kobject*, align 8
  store %struct.kobject* %0, %struct.kobject** %2, align 8
  %3 = load %struct.kobject*, %struct.kobject** %2, align 8
  %4 = icmp ne %struct.kobject* %3, null
  br i1 %4, label %5, label %17

; <label>:5:                                      ; preds = %1
  %6 = load %struct.kobject*, %struct.kobject** %2, align 8
  %7 = getelementptr inbounds %struct.kobject, %struct.kobject* %6, i32 0, i32 3
  %8 = load i8, i8* %7, align 8
  %9 = and i8 %8, 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %5
  br label %13

; <label>:13:                                     ; preds = %12, %5
  %14 = load %struct.kobject*, %struct.kobject** %2, align 8
  %15 = getelementptr inbounds %struct.kobject, %struct.kobject* %14, i32 0, i32 1
  %16 = call i32 @kref_put(%struct.kref* %15)
  br label %17

; <label>:17:                                     ; preds = %13, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @kref_put(%struct.kref*) #0 {
  %2 = alloca %struct.kref*, align 8
  store %struct.kref* %0, %struct.kref** %2, align 8
  %3 = load %struct.kref*, %struct.kref** %2, align 8
  %4 = getelementptr inbounds %struct.kref, %struct.kref* %3, i32 0, i32 0
  %5 = call i32 @refcount_dec_and_test(%struct.refcount_struct* %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %1
  br label %8

; <label>:8:                                      ; preds = %7, %1
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define void @put_device(%struct.device*) #0 {
  %2 = alloca %struct.device*, align 8
  store %struct.device* %0, %struct.device** %2, align 8
  %3 = load %struct.device*, %struct.device** %2, align 8
  %4 = icmp ne %struct.device* %3, null
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = load %struct.device*, %struct.device** %2, align 8
  %7 = getelementptr inbounds %struct.device, %struct.device* %6, i32 0, i32 1
  call void @kobject_put(%struct.kobject* %7)
  br label %8

; <label>:8:                                      ; preds = %5, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @power_supply_put(%struct.power_supply*) #0 {
  %2 = alloca %struct.power_supply*, align 8
  store %struct.power_supply* %0, %struct.power_supply** %2, align 8
  %3 = load %struct.power_supply*, %struct.power_supply** %2, align 8
  %4 = getelementptr inbounds %struct.power_supply, %struct.power_supply* %3, i32 0, i32 1
  call void @put_device(%struct.device* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @f() #0 {
  %1 = alloca %struct.power_supply*, align 8
  %2 = load i32, i32* @a, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4:                                      ; preds = %0
  br label %6

; <label>:5:                                      ; preds = %0
  store %struct.power_supply* @init, %struct.power_supply** %1, align 8
  br label %6

; <label>:6:                                      ; preds = %5, %4
  %7 = load %struct.power_supply*, %struct.power_supply** %1, align 8
  call void @power_supply_put(%struct.power_supply* %7)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
