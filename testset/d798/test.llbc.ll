; ModuleID = 'test.llbc'
source_filename = "/data/home/yizhuo/UBIAnalysis/unittest/d798/test.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ttm_buffer_object = type { i64, i8 }
%struct.vmw_dma_buffer = type { %struct.ttm_buffer_object }

@a = global i32 1, align 4
@tbobj = common global %struct.ttm_buffer_object* null, align 8
@vdbuffer = common global %struct.vmw_dma_buffer* null, align 8

; Function Attrs: nounwind uwtable
define i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo_p) #0 {
test.bc-doinit-0:
  %0 = alloca i32, align 4
  %1 = alloca %struct.vmw_dma_buffer**, align 8
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %1, align 8
  %2 = load i32, i32* @a, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %test.bc-doinit-1, label %test.bc-doinit-2

test.bc-doinit-1:                                 ; preds = %test.bc-doinit-0
  %4 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %1, align 8
  %5 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %4, align 8
  %6 = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %5, i32 0, i32 0
  %7 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8
  %8 = bitcast %struct.ttm_buffer_object* %6 to i8*
  %9 = bitcast %struct.ttm_buffer_object* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 16, i32 8, i1 false)
  br label %test.bc-doinit-3

test.bc-doinit-2:                                 ; preds = %test.bc-doinit-0
  store i32 0, i32* %0, align 4
  br label %test.bc-doinit-4

test.bc-doinit-3:                                 ; preds = %test.bc-doinit-1
  store i32 1, i32* %0, align 4
  br label %test.bc-doinit-4

test.bc-doinit-4:                                 ; preds = %test.bc-doinit-3, %test.bc-doinit-2
  %10 = load i32, i32* %0, align 4
  ret i32 %10
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %new_query_bo) #0 {
test.bc-vmw_query_bo_switch_prepare-0:
  %0 = alloca i32, align 4
  %1 = alloca %struct.ttm_buffer_object*, align 8
  store %struct.ttm_buffer_object* %new_query_bo, %struct.ttm_buffer_object** %1, align 8
  %2 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** %1, align 8
  %3 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8
  %4 = icmp ne %struct.ttm_buffer_object* %2, %3
  br i1 %4, label %test.bc-vmw_query_bo_switch_prepare-1, label %test.bc-vmw_query_bo_switch_prepare-2

test.bc-vmw_query_bo_switch_prepare-1:            ; preds = %test.bc-vmw_query_bo_switch_prepare-0
  store i32 -1, i32* %0, align 4
  br label %test.bc-vmw_query_bo_switch_prepare-3

test.bc-vmw_query_bo_switch_prepare-2:            ; preds = %test.bc-vmw_query_bo_switch_prepare-0
  store i32 0, i32* %0, align 4
  br label %test.bc-vmw_query_bo_switch_prepare-3

test.bc-vmw_query_bo_switch_prepare-3:            ; preds = %test.bc-vmw_query_bo_switch_prepare-2, %test.bc-vmw_query_bo_switch_prepare-1
  %5 = load i32, i32* %0, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo_p) #0 {
test.bc-vmw_translate_mob_ptr-0:
  %0 = alloca i32, align 4
  %1 = alloca %struct.vmw_dma_buffer**, align 8
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %1, align 8
  store %struct.vmw_dma_buffer* null, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %2 = call i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo)
  store i32 %2, i32* %ret, align 4
  %3 = load i32, i32* %ret, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %test.bc-vmw_translate_mob_ptr-1, label %test.bc-vmw_translate_mob_ptr-2

test.bc-vmw_translate_mob_ptr-1:                  ; preds = %test.bc-vmw_translate_mob_ptr-0
  store i32 0, i32* %0, align 4
  br label %test.bc-vmw_translate_mob_ptr-7

test.bc-vmw_translate_mob_ptr-2:                  ; preds = %test.bc-vmw_translate_mob_ptr-0
  %5 = load i32, i32* @a, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %test.bc-vmw_translate_mob_ptr-3, label %test.bc-vmw_translate_mob_ptr-4

test.bc-vmw_translate_mob_ptr-3:                  ; preds = %test.bc-vmw_translate_mob_ptr-2
  br label %test.bc-vmw_translate_mob_ptr-6

test.bc-vmw_translate_mob_ptr-4:                  ; preds = %test.bc-vmw_translate_mob_ptr-2
  br label %test.bc-vmw_translate_mob_ptr-5

test.bc-vmw_translate_mob_ptr-5:                  ; preds = %test.bc-vmw_translate_mob_ptr-4
  %7 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %8 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %1, align 8
  store %struct.vmw_dma_buffer* %7, %struct.vmw_dma_buffer** %8, align 8
  %9 = load i32, i32* %ret, align 4
  store i32 %9, i32* %0, align 4
  br label %test.bc-vmw_translate_mob_ptr-7

test.bc-vmw_translate_mob_ptr-6:                  ; preds = %test.bc-vmw_translate_mob_ptr-3
  store %struct.vmw_dma_buffer** null, %struct.vmw_dma_buffer*** %1, align 8
  %10 = load i32, i32* %ret, align 4
  store i32 %10, i32* %0, align 4
  br label %test.bc-vmw_translate_mob_ptr-7

test.bc-vmw_translate_mob_ptr-7:                  ; preds = %test.bc-vmw_translate_mob_ptr-6, %test.bc-vmw_translate_mob_ptr-5, %test.bc-vmw_translate_mob_ptr-1
  %11 = load i32, i32* %0, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @vmw_cmd_end_gb_query() #0 {
test.bc-vmw_cmd_end_gb_query-0:
  %0 = alloca i32, align 4
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  %1 = call i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo)
  store i32 %1, i32* %ret, align 4
  %2 = load i32, i32* %ret, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %test.bc-vmw_cmd_end_gb_query-1, label %test.bc-vmw_cmd_end_gb_query-2

test.bc-vmw_cmd_end_gb_query-1:                   ; preds = %test.bc-vmw_cmd_end_gb_query-0
  %4 = load i32, i32* %ret, align 4
  store i32 %4, i32* %0, align 4
  br label %test.bc-vmw_cmd_end_gb_query-3

test.bc-vmw_cmd_end_gb_query-2:                   ; preds = %test.bc-vmw_cmd_end_gb_query-0
  %5 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8
  %6 = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %5, i32 0, i32 0
  %7 = call i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %6)
  store i32 0, i32* %0, align 4
  br label %test.bc-vmw_cmd_end_gb_query-3

test.bc-vmw_cmd_end_gb_query-3:                   ; preds = %test.bc-vmw_cmd_end_gb_query-2, %test.bc-vmw_cmd_end_gb_query-1
  %8 = load i32, i32* %0, align 4
  ret i32 %8
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
