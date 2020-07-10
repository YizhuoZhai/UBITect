; ModuleID = './built-in.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.aStruct = type { i32 }
%struct.test_struct = type { i32, i32 }

@cpg = common dso_local global %struct.aStruct* null, align 8, !dbg !0
@init = common dso_local global %struct.test_struct* null, align 8, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @test(i32 %a) #0 !dbg !28 {
ve.bc-test-0:
  %a.addr = alloca i32, align 4
  %backlog = alloca %struct.test_struct*, align 8
  store i32 %a, i32* %a.addr, align 4
  %0 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8, !dbg !32
  %eng_st = getelementptr inbounds %struct.aStruct, %struct.aStruct* %0, i32 0, i32 0, !dbg !33
  store i32 1, i32* %eng_st, align 4, !dbg !34
  %1 = load i32, i32* %a.addr, align 4, !dbg !35
  %tobool = icmp ne i32 %1, 0, !dbg !35
  br i1 %tobool, label %ve.bc-test-1, label %ve.bc-test-2, !dbg !37

ve.bc-test-1:                                     ; preds = %ve.bc-test-0
  %2 = load %struct.test_struct*, %struct.test_struct** @init, align 8, !dbg !38
  store %struct.test_struct* %2, %struct.test_struct** %backlog, align 8, !dbg !40
  br label %ve.bc-test-2, !dbg !41

ve.bc-test-2:                                     ; preds = %ve.bc-test-1, %ve.bc-test-0
  %3 = load %struct.test_struct*, %struct.test_struct** %backlog, align 8, !dbg !42
  %tobool1 = icmp ne %struct.test_struct* %3, null, !dbg !42
  br i1 %tobool1, label %ve.bc-test-3, label %ve.bc-test-4, !dbg !44

ve.bc-test-3:                                     ; preds = %ve.bc-test-2
  %4 = load %struct.test_struct*, %struct.test_struct** %backlog, align 8, !dbg !45
  %irq = getelementptr inbounds %struct.test_struct, %struct.test_struct* %4, i32 0, i32 0, !dbg !47
  store i32 0, i32* %irq, align 4, !dbg !48
  %5 = load %struct.aStruct*, %struct.aStruct** @cpg, align 8, !dbg !49
  %eng_st3 = getelementptr inbounds %struct.aStruct, %struct.aStruct* %5, i32 0, i32 0, !dbg !50
  store i32 0, i32* %eng_st3, align 4, !dbg !51
  br label %ve.bc-test-4, !dbg !52

ve.bc-test-4:                                     ; preds = %ve.bc-test-3, %ve.bc-test-2
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.ident = !{!24}
!llvm.module.flags = !{!25, !26, !27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cpg", scope: !2, file: !3, line: 16, type: !20, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !11)
!3 = !DIFile(filename: "cve.c", directory: "/data/home/yizhuo/And-UBITect/testset/cve")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "engine_status", file: !3, line: 3, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10}
!8 = !DIEnumerator(name: "ENGINE_IDLE", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "ENGINE_BUSY", value: 1, isUnsigned: true)
!10 = !DIEnumerator(name: "ENGINE_W_DEQUEUE", value: 2, isUnsigned: true)
!11 = !{!12, !0}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "init", scope: !2, file: !3, line: 15, type: !14, isLocal: false, isDefinition: true)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "test_struct", file: !3, line: 8, size: 64, elements: !16)
!16 = !{!17, !19}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "irq", scope: !15, file: !3, line: 9, baseType: !18, size: 32)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "eng_st", scope: !15, file: !3, line: 10, baseType: !5, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aStruct", file: !3, line: 12, size: 32, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "eng_st", scope: !21, file: !3, line: 13, baseType: !5, size: 32)
!24 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!25 = !{i32 2, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = distinct !DISubprogram(name: "test", scope: !3, file: !3, line: 17, type: !29, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{!18, !18}
!31 = !{}
!32 = !DILocation(line: 19, column: 2, scope: !28)
!33 = !DILocation(line: 19, column: 7, scope: !28)
!34 = !DILocation(line: 19, column: 14, scope: !28)
!35 = !DILocation(line: 21, column: 6, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !3, line: 21, column: 6)
!37 = !DILocation(line: 21, column: 6, scope: !28)
!38 = !DILocation(line: 22, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !3, line: 21, column: 8)
!40 = !DILocation(line: 22, column: 11, scope: !39)
!41 = !DILocation(line: 23, column: 2, scope: !39)
!42 = !DILocation(line: 25, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !28, file: !3, line: 25, column: 5)
!44 = !DILocation(line: 25, column: 5, scope: !28)
!45 = !DILocation(line: 26, column: 3, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 25, column: 13)
!47 = !DILocation(line: 26, column: 12, scope: !46)
!48 = !DILocation(line: 26, column: 16, scope: !46)
!49 = !DILocation(line: 27, column: 3, scope: !46)
!50 = !DILocation(line: 27, column: 8, scope: !46)
!51 = !DILocation(line: 27, column: 15, scope: !46)
!52 = !DILocation(line: 28, column: 2, scope: !46)
!53 = !DILocation(line: 29, column: 2, scope: !28)
