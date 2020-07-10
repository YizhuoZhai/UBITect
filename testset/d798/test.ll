; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ttm_buffer_object = type { i64, i8 }
%struct.vmw_dma_buffer = type { %struct.ttm_buffer_object }

@a = global i32 1, align 4
@tbobj = common global %struct.ttm_buffer_object* null, align 8
@vdbuffer = common global %struct.vmw_dma_buffer* null, align 8

; Function Attrs: nounwind uwtable
define i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo_p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.vmw_dma_buffer**, align 8
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %2, align 8
  %3 = load i32, i32* @a, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %0
  %6 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %2, align 8
  %7 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %6, align 8
  %8 = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %7, i32 0, i32 0
  %9 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8
  %10 = bitcast %struct.ttm_buffer_object* %8 to i8*
  %11 = bitcast %struct.ttm_buffer_object* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 8, i1 false)
  br label %13

; <label>:12                                      ; preds = %0
  store i32 0, i32* %1, align 4
  br label %14

; <label>:13                                      ; preds = %5
  store i32 1, i32* %1, align 4
  br label %14

; <label>:14                                      ; preds = %13, %12
  %15 = load i32, i32* %1, align 4
  ret i32 %15
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %new_query_bo) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.ttm_buffer_object*, align 8
  store %struct.ttm_buffer_object* %new_query_bo, %struct.ttm_buffer_object** %2, align 8
  %3 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** %2, align 8
  %4 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8
  %5 = icmp ne %struct.ttm_buffer_object* %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 -1, i32* %1, align 4
  br label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1, align 4
  br label %8

; <label>:8                                       ; preds = %7, %6
  %9 = load i32, i32* %1, align 4
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo_p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.vmw_dma_buffer**, align 8
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %2, align 8
  store %struct.vmw_dma_buffer* null, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %3 = call i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo)
  store i32 %3, i32* %ret, align 4
  %4 = load i32, i32* %ret, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1, align 4
  br label %18

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* @a, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7
  br label %16

; <label>:11                                      ; preds = %7
  br label %12

; <label>:12                                      ; preds = %11
  %13 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %14 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %2, align 8
  store %struct.vmw_dma_buffer* %13, %struct.vmw_dma_buffer** %14, align 8
  %15 = load i32, i32* %ret, align 4
  store i32 %15, i32* %1, align 4
  br label %18

; <label>:16                                      ; preds = %10
  store %struct.vmw_dma_buffer** null, %struct.vmw_dma_buffer*** %2, align 8
  %17 = load i32, i32* %ret, align 4
  store i32 %17, i32* %1, align 4
  br label %18

; <label>:18                                      ; preds = %16, %12, %6
  %19 = load i32, i32* %1, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @vmw_cmd_end_gb_query() #0 {
  %1 = alloca i32, align 4
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  %2 = call i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo)
  store i32 %2, i32* %ret, align 4
  %3 = load i32, i32* %ret, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %ret, align 4
  store i32 %6, i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %9 = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %8, i32 0, i32 0
  %10 = call i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %9)
  store i32 0, i32* %1, align 4
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = load i32, i32* %1, align 4
  ret i32 %12
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
