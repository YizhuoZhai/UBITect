; ModuleID = './built-in.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ttm_buffer_object = type { i64, i8 }
%struct.vmw_dma_buffer = type { %struct.ttm_buffer_object }

@a = dso_local global i32 1, align 4, !dbg !0
@tbobj = common dso_local global %struct.ttm_buffer_object* null, align 8, !dbg !6
@vdbuffer = common dso_local global %struct.vmw_dma_buffer* null, align 8, !dbg !17

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo_p) #0 !dbg !31 {
est.bc-doinit-0:
  %retval = alloca i32, align 4
  %vmw_bo_p.addr = alloca %struct.vmw_dma_buffer**, align 8
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %vmw_bo_p.addr, align 8
  %0 = load i32, i32* @a, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 1, !dbg !37
  br i1 %cmp, label %est.bc-doinit-1, label %est.bc-doinit-2, !dbg !38

est.bc-doinit-1:                                  ; preds = %est.bc-doinit-0
  %1 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %vmw_bo_p.addr, align 8, !dbg !39
  %2 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %1, align 8, !dbg !41
  %base = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %2, i32 0, i32 0, !dbg !42
  %3 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8, !dbg !43
  %4 = bitcast %struct.ttm_buffer_object* %base to i8*, !dbg !44
  %5 = bitcast %struct.ttm_buffer_object* %3 to i8*, !dbg !44
  %6 = call i8* @memcpy(i8* %4, i8* %5, i64 16), !dbg !44
  br label %est.bc-doinit-3, !dbg !45

est.bc-doinit-2:                                  ; preds = %est.bc-doinit-0
  store i32 0, i32* %retval, align 4, !dbg !46
  br label %est.bc-doinit-4, !dbg !46

est.bc-doinit-3:                                  ; preds = %est.bc-doinit-1
  store i32 1, i32* %retval, align 4, !dbg !48
  br label %est.bc-doinit-4, !dbg !48

est.bc-doinit-4:                                  ; preds = %est.bc-doinit-3, %est.bc-doinit-2
  %7 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %7, !dbg !49
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %new_query_bo) #0 !dbg !50 {
est.bc-vmw_query_bo_switch_prepare-0:
  %retval = alloca i32, align 4
  %new_query_bo.addr = alloca %struct.ttm_buffer_object*, align 8
  store %struct.ttm_buffer_object* %new_query_bo, %struct.ttm_buffer_object** %new_query_bo.addr, align 8
  %0 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** %new_query_bo.addr, align 8, !dbg !53
  %1 = load %struct.ttm_buffer_object*, %struct.ttm_buffer_object** @tbobj, align 8, !dbg !55
  %cmp = icmp ne %struct.ttm_buffer_object* %0, %1, !dbg !56
  br i1 %cmp, label %est.bc-vmw_query_bo_switch_prepare-1, label %est.bc-vmw_query_bo_switch_prepare-2, !dbg !57

est.bc-vmw_query_bo_switch_prepare-1:             ; preds = %est.bc-vmw_query_bo_switch_prepare-0
  store i32 -1, i32* %retval, align 4, !dbg !58
  br label %est.bc-vmw_query_bo_switch_prepare-3, !dbg !58

est.bc-vmw_query_bo_switch_prepare-2:             ; preds = %est.bc-vmw_query_bo_switch_prepare-0
  store i32 0, i32* %retval, align 4, !dbg !60
  br label %est.bc-vmw_query_bo_switch_prepare-3, !dbg !60

est.bc-vmw_query_bo_switch_prepare-3:             ; preds = %est.bc-vmw_query_bo_switch_prepare-2, %est.bc-vmw_query_bo_switch_prepare-1
  %2 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %2, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo_p) #0 !dbg !63 {
est.bc-vmw_translate_mob_ptr-0:
  %retval = alloca i32, align 4
  %vmw_bo_p.addr = alloca %struct.vmw_dma_buffer**, align 8
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  store %struct.vmw_dma_buffer** %vmw_bo_p, %struct.vmw_dma_buffer*** %vmw_bo_p.addr, align 8
  store %struct.vmw_dma_buffer* null, %struct.vmw_dma_buffer** %vmw_bo, align 8, !dbg !64
  %call = call i32 @doinit(%struct.vmw_dma_buffer** %vmw_bo), !dbg !65
  store i32 %call, i32* %ret, align 4, !dbg !66
  %0 = load i32, i32* %ret, align 4, !dbg !67
  %cmp = icmp ne i32 %0, 0, !dbg !69
  br i1 %cmp, label %est.bc-vmw_translate_mob_ptr-1, label %est.bc-vmw_translate_mob_ptr-2, !dbg !70

est.bc-vmw_translate_mob_ptr-1:                   ; preds = %est.bc-vmw_translate_mob_ptr-0
  store i32 0, i32* %retval, align 4, !dbg !71
  br label %est.bc-vmw_translate_mob_ptr-7, !dbg !71

est.bc-vmw_translate_mob_ptr-2:                   ; preds = %est.bc-vmw_translate_mob_ptr-0
  %1 = load i32, i32* @a, align 4, !dbg !73
  %cmp1 = icmp eq i32 %1, 1, !dbg !75
  br i1 %cmp1, label %est.bc-vmw_translate_mob_ptr-3, label %est.bc-vmw_translate_mob_ptr-4, !dbg !76

est.bc-vmw_translate_mob_ptr-3:                   ; preds = %est.bc-vmw_translate_mob_ptr-2
  br label %est.bc-vmw_translate_mob_ptr-6, !dbg !77

est.bc-vmw_translate_mob_ptr-4:                   ; preds = %est.bc-vmw_translate_mob_ptr-2
  br label %est.bc-vmw_translate_mob_ptr-5

est.bc-vmw_translate_mob_ptr-5:                   ; preds = %est.bc-vmw_translate_mob_ptr-4
  %2 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8, !dbg !79
  %3 = load %struct.vmw_dma_buffer**, %struct.vmw_dma_buffer*** %vmw_bo_p.addr, align 8, !dbg !80
  store %struct.vmw_dma_buffer* %2, %struct.vmw_dma_buffer** %3, align 8, !dbg !81
  %4 = load i32, i32* %ret, align 4, !dbg !82
  store i32 %4, i32* %retval, align 4, !dbg !83
  br label %est.bc-vmw_translate_mob_ptr-7, !dbg !83

est.bc-vmw_translate_mob_ptr-6:                   ; preds = %est.bc-vmw_translate_mob_ptr-3
  store %struct.vmw_dma_buffer** null, %struct.vmw_dma_buffer*** %vmw_bo_p.addr, align 8, !dbg !84
  %5 = load i32, i32* %ret, align 4, !dbg !85
  store i32 %5, i32* %retval, align 4, !dbg !86
  br label %est.bc-vmw_translate_mob_ptr-7, !dbg !86

est.bc-vmw_translate_mob_ptr-7:                   ; preds = %est.bc-vmw_translate_mob_ptr-6, %est.bc-vmw_translate_mob_ptr-5, %est.bc-vmw_translate_mob_ptr-1
  %6 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %6, !dbg !87
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vmw_cmd_end_gb_query() #0 !dbg !88 {
est.bc-vmw_cmd_end_gb_query-0:
  %retval = alloca i32, align 4
  %vmw_bo = alloca %struct.vmw_dma_buffer*, align 8
  %ret = alloca i32, align 4
  %call = call i32 @vmw_translate_mob_ptr(%struct.vmw_dma_buffer** %vmw_bo), !dbg !91
  store i32 %call, i32* %ret, align 4, !dbg !92
  %0 = load i32, i32* %ret, align 4, !dbg !93
  %cmp = icmp ne i32 %0, 0, !dbg !95
  br i1 %cmp, label %est.bc-vmw_cmd_end_gb_query-1, label %est.bc-vmw_cmd_end_gb_query-2, !dbg !96

est.bc-vmw_cmd_end_gb_query-1:                    ; preds = %est.bc-vmw_cmd_end_gb_query-0
  %1 = load i32, i32* %ret, align 4, !dbg !97
  store i32 %1, i32* %retval, align 4, !dbg !99
  br label %est.bc-vmw_cmd_end_gb_query-3, !dbg !99

est.bc-vmw_cmd_end_gb_query-2:                    ; preds = %est.bc-vmw_cmd_end_gb_query-0
  %2 = load %struct.vmw_dma_buffer*, %struct.vmw_dma_buffer** %vmw_bo, align 8, !dbg !100
  %base = getelementptr inbounds %struct.vmw_dma_buffer, %struct.vmw_dma_buffer* %2, i32 0, i32 0, !dbg !101
  %call1 = call i32 @vmw_query_bo_switch_prepare(%struct.ttm_buffer_object* %base), !dbg !102
  store i32 0, i32* %retval, align 4, !dbg !103
  br label %est.bc-vmw_cmd_end_gb_query-3, !dbg !103

est.bc-vmw_cmd_end_gb_query-3:                    ; preds = %est.bc-vmw_cmd_end_gb_query-2, %est.bc-vmw_cmd_end_gb_query-1
  %3 = load i32, i32* %retval, align 4, !dbg !104
  ret i32 %3, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 !dbg !105 {
entry:
  %destaddr.addr = alloca i8*, align 8
  %srcaddr.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i8* %destaddr, i8** %destaddr.addr, align 8
  store i8* %srcaddr, i8** %srcaddr.addr, align 8
  store i64 %len, i64* %len.addr, align 8
  %0 = load i8*, i8** %destaddr.addr, align 8, !dbg !113
  store i8* %0, i8** %dest, align 8, !dbg !114
  %1 = load i8*, i8** %srcaddr.addr, align 8, !dbg !115
  store i8* %1, i8** %src, align 8, !dbg !116
  br label %while.cond, !dbg !117

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !118
  %dec = add i64 %2, -1, !dbg !118
  store i64 %dec, i64* %len.addr, align 8, !dbg !118
  %cmp = icmp ugt i64 %2, 0, !dbg !119
  br i1 %cmp, label %while.body, label %while.end, !dbg !117

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src, align 8, !dbg !120
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !120
  store i8* %incdec.ptr, i8** %src, align 8, !dbg !120
  %4 = load i8, i8* %3, align 1, !dbg !121
  %5 = load i8*, i8** %dest, align 8, !dbg !122
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !122
  store i8* %incdec.ptr1, i8** %dest, align 8, !dbg !122
  store i8 %4, i8* %5, align 1, !dbg !123
  br label %while.cond, !dbg !117, !llvm.loop !124

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %destaddr.addr, align 8, !dbg !125
  ret i8* %6, !dbg !126
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2, !24}
!llvm.ident = !{!26, !27}
!llvm.module.flags = !{!28, !29, !30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 4, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5)
!3 = !DIFile(filename: "test.c", directory: "/home/yizhuo/And-UBITect/testset/d798")
!4 = !{}
!5 = !{!0, !6, !17}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "tbobj", scope: !2, file: !3, line: 12, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ttm_buffer_object", file: !3, line: 5, size: 128, elements: !10)
!10 = !{!11, !15}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "acc_size", scope: !9, file: !3, line: 6, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 62, baseType: !14)
!13 = !DIFile(filename: "/data/home/yizhuo/llvm-7.0.0/build-dbg/lib/clang/7.0.0/include/stddef.h", directory: "/home/yizhuo/And-UBITect/testset/d798")
!14 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "evicted", scope: !9, file: !3, line: 7, baseType: !16, size: 8, offset: 64)
!16 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "vdbuffer", scope: !2, file: !3, line: 13, type: !19, isLocal: false, isDefinition: true)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vmw_dma_buffer", file: !3, line: 9, size: 128, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "base", scope: !20, file: !3, line: 10, baseType: !9, size: 128)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = distinct !DICompileUnit(language: DW_LANG_C89, file: !25, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!25 = !DIFile(filename: "/home/yizhuo/klee/2018_klee_confirm_path/runtime/FreeStanding/memcpy.c", directory: "/data/home/yizhuo/klee/2018_klee_confirm_path/build/runtime/FreeStanding")
!26 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!27 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!28 = !{i32 2, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{i32 1, !"wchar_size", i32 4}
!31 = distinct !DISubprogram(name: "doinit", scope: !3, file: !3, line: 14, type: !32, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{!23, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!35 = !DILocation(line: 15, column: 5, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !3, line: 15, column: 5)
!37 = !DILocation(line: 15, column: 7, scope: !36)
!38 = !DILocation(line: 15, column: 5, scope: !31)
!39 = !DILocation(line: 16, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !3, line: 15, column: 11)
!41 = !DILocation(line: 16, column: 4, scope: !40)
!42 = !DILocation(line: 16, column: 16, scope: !40)
!43 = !DILocation(line: 16, column: 24, scope: !40)
!44 = !DILocation(line: 16, column: 23, scope: !40)
!45 = !DILocation(line: 17, column: 2, scope: !40)
!46 = !DILocation(line: 19, column: 3, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !3, line: 18, column: 6)
!48 = !DILocation(line: 22, column: 2, scope: !31)
!49 = !DILocation(line: 23, column: 1, scope: !31)
!50 = distinct !DISubprogram(name: "vmw_query_bo_switch_prepare", scope: !3, file: !3, line: 24, type: !51, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!23, !8}
!53 = !DILocation(line: 25, column: 6, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 25, column: 6)
!55 = !DILocation(line: 25, column: 22, scope: !54)
!56 = !DILocation(line: 25, column: 19, scope: !54)
!57 = !DILocation(line: 25, column: 6, scope: !50)
!58 = !DILocation(line: 26, column: 3, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 25, column: 28)
!60 = !DILocation(line: 29, column: 3, scope: !61)
!61 = distinct !DILexicalBlock(scope: !54, file: !3, line: 28, column: 6)
!62 = !DILocation(line: 31, column: 1, scope: !50)
!63 = distinct !DISubprogram(name: "vmw_translate_mob_ptr", scope: !3, file: !3, line: 32, type: !32, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 33, column: 25, scope: !63)
!65 = !DILocation(line: 34, column: 12, scope: !63)
!66 = !DILocation(line: 34, column: 6, scope: !63)
!67 = !DILocation(line: 35, column: 5, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 35, column: 5)
!69 = !DILocation(line: 35, column: 9, scope: !68)
!70 = !DILocation(line: 35, column: 5, scope: !63)
!71 = !DILocation(line: 36, column: 3, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 35, column: 14)
!73 = !DILocation(line: 38, column: 10, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !3, line: 38, column: 10)
!75 = !DILocation(line: 38, column: 12, scope: !74)
!76 = !DILocation(line: 38, column: 10, scope: !68)
!77 = !DILocation(line: 39, column: 3, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 38, column: 17)
!79 = !DILocation(line: 41, column: 14, scope: !63)
!80 = !DILocation(line: 41, column: 3, scope: !63)
!81 = !DILocation(line: 41, column: 12, scope: !63)
!82 = !DILocation(line: 42, column: 9, scope: !63)
!83 = !DILocation(line: 42, column: 2, scope: !63)
!84 = !DILocation(line: 44, column: 11, scope: !63)
!85 = !DILocation(line: 45, column: 9, scope: !63)
!86 = !DILocation(line: 45, column: 2, scope: !63)
!87 = !DILocation(line: 46, column: 1, scope: !63)
!88 = distinct !DISubprogram(name: "vmw_cmd_end_gb_query", scope: !3, file: !3, line: 47, type: !89, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: false, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!23}
!91 = !DILocation(line: 49, column: 12, scope: !88)
!92 = !DILocation(line: 49, column: 6, scope: !88)
!93 = !DILocation(line: 50, column: 5, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !3, line: 50, column: 5)
!95 = !DILocation(line: 50, column: 9, scope: !94)
!96 = !DILocation(line: 50, column: 5, scope: !88)
!97 = !DILocation(line: 51, column: 10, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 50, column: 14)
!99 = !DILocation(line: 51, column: 3, scope: !98)
!100 = !DILocation(line: 53, column: 31, scope: !88)
!101 = !DILocation(line: 53, column: 39, scope: !88)
!102 = !DILocation(line: 53, column: 2, scope: !88)
!103 = !DILocation(line: 54, column: 2, scope: !88)
!104 = !DILocation(line: 55, column: 1, scope: !88)
!105 = distinct !DISubprogram(name: "memcpy", scope: !25, file: !25, line: 12, type: !106, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !24, retainedNodes: !4)
!106 = !DISubroutineType(types: !107)
!107 = !{!108, !108, !109, !111}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !112, line: 62, baseType: !14)
!112 = !DIFile(filename: "/data2/yuh/build/llvm-7.0.0.src/build/lib/clang/7.0.0/include/stddef.h", directory: "/data/home/yizhuo/klee/2018_klee_confirm_path/build/runtime/FreeStanding")
!113 = !DILocation(line: 13, column: 16, scope: !105)
!114 = !DILocation(line: 13, column: 9, scope: !105)
!115 = !DILocation(line: 14, column: 21, scope: !105)
!116 = !DILocation(line: 14, column: 15, scope: !105)
!117 = !DILocation(line: 16, column: 3, scope: !105)
!118 = !DILocation(line: 16, column: 13, scope: !105)
!119 = !DILocation(line: 16, column: 16, scope: !105)
!120 = !DILocation(line: 17, column: 19, scope: !105)
!121 = !DILocation(line: 17, column: 15, scope: !105)
!122 = !DILocation(line: 17, column: 10, scope: !105)
!123 = !DILocation(line: 17, column: 13, scope: !105)
!124 = distinct !{!124, !117, !120}
!125 = !DILocation(line: 18, column: 10, scope: !105)
!126 = !DILocation(line: 18, column: 3, scope: !105)
