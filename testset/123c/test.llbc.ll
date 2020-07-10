; ModuleID = 'test.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/123c/test.bc"
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

; Function Attrs: nounwind uwtable
define i32 @refcount_dec_and_test(%struct.refcount_struct* %r) #0 {
test.bc-refcount_dec_and_test-0:
  %0 = alloca %struct.refcount_struct*, align 8
  store %struct.refcount_struct* %r, %struct.refcount_struct** %0, align 8
  %1 = load %struct.refcount_struct*, %struct.refcount_struct** %0, align 8
  %2 = getelementptr inbounds %struct.refcount_struct, %struct.refcount_struct* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.atomic_t, %struct.atomic_t* %2, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %test.bc-refcount_dec_and_test-1, label %test.bc-refcount_dec_and_test-2

test.bc-refcount_dec_and_test-1:                  ; preds = %test.bc-refcount_dec_and_test-0
  br label %test.bc-refcount_dec_and_test-2

test.bc-refcount_dec_and_test-2:                  ; preds = %test.bc-refcount_dec_and_test-1, %test.bc-refcount_dec_and_test-0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @kobject_put(%struct.kobject* %kobj) #0 {
test.bc-kobject_put-0:
  %0 = alloca %struct.kobject*, align 8
  store %struct.kobject* %kobj, %struct.kobject** %0, align 8
  %1 = load %struct.kobject*, %struct.kobject** %0, align 8
  %2 = icmp ne %struct.kobject* %1, null
  br i1 %2, label %test.bc-kobject_put-1, label %test.bc-kobject_put-4

test.bc-kobject_put-1:                            ; preds = %test.bc-kobject_put-0
  %3 = load %struct.kobject*, %struct.kobject** %0, align 8
  %4 = getelementptr inbounds %struct.kobject, %struct.kobject* %3, i32 0, i32 3
  %5 = load i8, i8* %4, align 8
  %6 = and i8 %5, 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %test.bc-kobject_put-3, label %test.bc-kobject_put-2

test.bc-kobject_put-2:                            ; preds = %test.bc-kobject_put-1
  br label %test.bc-kobject_put-3

test.bc-kobject_put-3:                            ; preds = %test.bc-kobject_put-2, %test.bc-kobject_put-1
  %9 = load %struct.kobject*, %struct.kobject** %0, align 8
  %10 = getelementptr inbounds %struct.kobject, %struct.kobject* %9, i32 0, i32 1
  %11 = call i32 @kref_put(%struct.kref* %10)
  br label %test.bc-kobject_put-4

test.bc-kobject_put-4:                            ; preds = %test.bc-kobject_put-3, %test.bc-kobject_put-0
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @kref_put(%struct.kref* %kref) #1 {
test.bc-kref_put-0:
  %0 = alloca %struct.kref*, align 8
  store %struct.kref* %kref, %struct.kref** %0, align 8
  %1 = load %struct.kref*, %struct.kref** %0, align 8
  %2 = getelementptr inbounds %struct.kref, %struct.kref* %1, i32 0, i32 0
  %3 = call i32 @refcount_dec_and_test(%struct.refcount_struct* %2)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %test.bc-kref_put-1, label %test.bc-kref_put-2

test.bc-kref_put-1:                               ; preds = %test.bc-kref_put-0
  br label %test.bc-kref_put-2

test.bc-kref_put-2:                               ; preds = %test.bc-kref_put-1, %test.bc-kref_put-0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @put_device(%struct.device* %dev) #0 {
test.bc-put_device-0:
  %0 = alloca %struct.device*, align 8
  store %struct.device* %dev, %struct.device** %0, align 8
  %1 = load %struct.device*, %struct.device** %0, align 8
  %2 = icmp ne %struct.device* %1, null
  br i1 %2, label %test.bc-put_device-1, label %test.bc-put_device-2

test.bc-put_device-1:                             ; preds = %test.bc-put_device-0
  %3 = load %struct.device*, %struct.device** %0, align 8
  %4 = getelementptr inbounds %struct.device, %struct.device* %3, i32 0, i32 1
  call void @kobject_put(%struct.kobject* %4)
  br label %test.bc-put_device-2

test.bc-put_device-2:                             ; preds = %test.bc-put_device-1, %test.bc-put_device-0
  ret void
}

; Function Attrs: nounwind uwtable
define void @power_supply_put(%struct.power_supply* %psy) #0 {
test.bc-power_supply_put-0:
  %0 = alloca %struct.power_supply*, align 8
  store %struct.power_supply* %psy, %struct.power_supply** %0, align 8
  %1 = load %struct.power_supply*, %struct.power_supply** %0, align 8
  %2 = getelementptr inbounds %struct.power_supply, %struct.power_supply* %1, i32 0, i32 1
  call void @put_device(%struct.device* %2)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
test.bc-f-0:
  %psy = alloca %struct.power_supply*, align 8
  %0 = load i32, i32* @a, align 4
  %1 = icmp eq i32 %0, 1
  br i1 %1, label %test.bc-f-1, label %test.bc-f-2

test.bc-f-1:                                      ; preds = %test.bc-f-0
  br label %test.bc-f-3

test.bc-f-2:                                      ; preds = %test.bc-f-0
  store %struct.power_supply* @init, %struct.power_supply** %psy, align 8
  br label %test.bc-f-3

test.bc-f-3:                                      ; preds = %test.bc-f-2, %test.bc-f-1
  %2 = load %struct.power_supply*, %struct.power_supply** %psy, align 8
  call void @power_supply_put(%struct.power_supply* %2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
