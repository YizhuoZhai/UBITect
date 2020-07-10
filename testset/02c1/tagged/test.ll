; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fib_result = type { i8, i8, i8, i8, i32, %struct.fib_info*, %struct.fib_table* }
%struct.fib_info = type { i32 }
%struct.fib_table = type { i32, i64* }

@a = dso_local global i32 0, align 4, !dbg !0
@fs = dso_local global %struct.fib_result { i8 97, i8 0, i8 0, i8 0, i32 0, %struct.fib_info* null, %struct.fib_table* null }, align 8, !dbg !6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fib_table_lookup(%struct.fib_result* %res) #0 !dbg !34 {
est.bc-fib_table_lookup-0:
  %res.addr = alloca %struct.fib_result*, align 8
  store %struct.fib_result* %res, %struct.fib_result** %res.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fib_result** %res.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @a, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %est.bc-fib_table_lookup-1, label %est.bc-fib_table_lookup-2, !dbg !42

est.bc-fib_table_lookup-1:                        ; preds = %est.bc-fib_table_lookup-0
  store %struct.fib_result* @fs, %struct.fib_result** %res.addr, align 8, !dbg !43
  br label %est.bc-fib_table_lookup-2, !dbg !45

est.bc-fib_table_lookup-2:                        ; preds = %est.bc-fib_table_lookup-1, %est.bc-fib_table_lookup-0
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fib_lookup(%struct.fib_result* %res) #0 !dbg !47 {
est.bc-fib_lookup-0:
  %res.addr = alloca %struct.fib_result*, align 8
  %err = alloca i32, align 4
  store %struct.fib_result* %res, %struct.fib_result** %res.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.fib_result** %res.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %err, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -51, i32* %err, align 4, !dbg !51
  %0 = load i32, i32* @a, align 4, !dbg !52
  %tobool = icmp ne i32 %0, 0, !dbg !52
  br i1 %tobool, label %est.bc-fib_lookup-1, label %est.bc-fib_lookup-2, !dbg !54

est.bc-fib_lookup-1:                              ; preds = %est.bc-fib_lookup-0
  %1 = load %struct.fib_result*, %struct.fib_result** %res.addr, align 8, !dbg !55
  %call = call i32 @fib_table_lookup(%struct.fib_result* %1), !dbg !56
  store i32 %call, i32* %err, align 4, !dbg !57
  br label %est.bc-fib_lookup-2, !dbg !58

est.bc-fib_lookup-2:                              ; preds = %est.bc-fib_lookup-1, %est.bc-fib_lookup-0
  %2 = load i32, i32* %err, align 4, !dbg !59
  %cmp = icmp eq i32 %2, -35, !dbg !61
  br i1 %cmp, label %est.bc-fib_lookup-3, label %est.bc-fib_lookup-4, !dbg !62

est.bc-fib_lookup-3:                              ; preds = %est.bc-fib_lookup-2
  store i32 -51, i32* %err, align 4, !dbg !63
  br label %est.bc-fib_lookup-4, !dbg !64

est.bc-fib_lookup-4:                              ; preds = %est.bc-fib_lookup-3, %est.bc-fib_lookup-2
  %3 = load i32, i32* %err, align 4, !dbg !65
  ret i32 %3, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ip_route_input_slow() #0 !dbg !67 {
est.bc-ip_route_input_slow-0:
  %res = alloca %struct.fib_result, align 8
  %err = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.fib_result* %res, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %err, metadata !72, metadata !DIExpression()), !dbg !73
  %fi = getelementptr inbounds %struct.fib_result, %struct.fib_result* %res, i32 0, i32 5, !dbg !74
  store %struct.fib_info* null, %struct.fib_info** %fi, align 8, !dbg !75
  %call = call i32 @fib_lookup(%struct.fib_result* %res), !dbg !76
  store i32 %call, i32* %err, align 4, !dbg !77
  %table = getelementptr inbounds %struct.fib_result, %struct.fib_result* %res, i32 0, i32 6, !dbg !78
  %0 = load %struct.fib_table*, %struct.fib_table** %table, align 8, !dbg !78
  %tobool = icmp ne %struct.fib_table* %0, null, !dbg !80
  br i1 %tobool, label %est.bc-ip_route_input_slow-1, label %est.bc-ip_route_input_slow-2, !dbg !81

est.bc-ip_route_input_slow-1:                     ; preds = %est.bc-ip_route_input_slow-0
  store i32 1, i32* @a, align 4, !dbg !82
  br label %est.bc-ip_route_input_slow-2, !dbg !84

est.bc-ip_route_input_slow-2:                     ; preds = %est.bc-ip_route_input_slow-1, %est.bc-ip_route_input_slow-0
  %1 = load i32, i32* @a, align 4, !dbg !85
  ret i32 %1, !dbg !86
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 4, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5)
!3 = !DIFile(filename: "test.c", directory: "/data/home/yizhuo/And-UBITect/testset/02c1")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "fs", scope: !2, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fib_result", file: !3, line: 13, size: 192, elements: !9)
!9 = !{!10, !12, !13, !14, !15, !17, !22}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !8, file: !3, line: 14, baseType: !11, size: 8)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "nh_sel", scope: !8, file: !3, line: 15, baseType: !11, size: 8, offset: 8)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !8, file: !3, line: 16, baseType: !11, size: 8, offset: 16)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "scope", scope: !8, file: !3, line: 17, baseType: !11, size: 8, offset: 24)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "tclassid", scope: !8, file: !3, line: 18, baseType: !16, size: 32, offset: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "fi", scope: !8, file: !3, line: 19, baseType: !18, size: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fib_info", file: !3, line: 5, size: 32, elements: !20)
!20 = !{!21}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "fib_treeref", scope: !19, file: !3, line: 6, baseType: !16, size: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "table", scope: !8, file: !3, line: 20, baseType: !23, size: 64, offset: 128)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fib_table", file: !3, line: 8, size: 128, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tb_id", scope: !24, file: !3, line: 10, baseType: !16, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tb_data", scope: !24, file: !3, line: 11, baseType: !28, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !{i32 2, !"Dwarf Version", i32 4}
!31 = !{i32 2, !"Debug Info Version", i32 3}
!32 = !{i32 1, !"wchar_size", i32 4}
!33 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!34 = distinct !DISubprogram(name: "fib_table_lookup", scope: !3, file: !3, line: 23, type: !35, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!16, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!38 = !DILocalVariable(name: "res", arg: 1, scope: !34, file: !3, line: 23, type: !37)
!39 = !DILocation(line: 23, column: 41, scope: !34)
!40 = !DILocation(line: 25, column: 5, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !3, line: 25, column: 5)
!42 = !DILocation(line: 25, column: 5, scope: !34)
!43 = !DILocation(line: 27, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !3, line: 26, column: 2)
!45 = !DILocation(line: 28, column: 2, scope: !44)
!46 = !DILocation(line: 29, column: 2, scope: !34)
!47 = distinct !DISubprogram(name: "fib_lookup", scope: !3, file: !3, line: 31, type: !35, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!48 = !DILocalVariable(name: "res", arg: 1, scope: !47, file: !3, line: 31, type: !37)
!49 = !DILocation(line: 31, column: 35, scope: !47)
!50 = !DILocalVariable(name: "err", scope: !47, file: !3, line: 33, type: !16)
!51 = !DILocation(line: 33, column: 6, scope: !47)
!52 = !DILocation(line: 35, column: 6, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !3, line: 35, column: 6)
!54 = !DILocation(line: 35, column: 6, scope: !47)
!55 = !DILocation(line: 36, column: 26, scope: !53)
!56 = !DILocation(line: 36, column: 9, scope: !53)
!57 = !DILocation(line: 36, column: 7, scope: !53)
!58 = !DILocation(line: 36, column: 3, scope: !53)
!59 = !DILocation(line: 38, column: 6, scope: !60)
!60 = distinct !DILexicalBlock(scope: !47, file: !3, line: 38, column: 6)
!61 = !DILocation(line: 38, column: 10, scope: !60)
!62 = !DILocation(line: 38, column: 6, scope: !47)
!63 = !DILocation(line: 39, column: 7, scope: !60)
!64 = !DILocation(line: 39, column: 3, scope: !60)
!65 = !DILocation(line: 41, column: 9, scope: !47)
!66 = !DILocation(line: 41, column: 2, scope: !47)
!67 = distinct !DISubprogram(name: "ip_route_input_slow", scope: !3, file: !3, line: 43, type: !68, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !2, retainedNodes: !4)
!68 = !DISubroutineType(types: !69)
!69 = !{!16}
!70 = !DILocalVariable(name: "res", scope: !67, file: !3, line: 45, type: !8)
!71 = !DILocation(line: 45, column: 20, scope: !67)
!72 = !DILocalVariable(name: "err", scope: !67, file: !3, line: 46, type: !16)
!73 = !DILocation(line: 46, column: 6, scope: !67)
!74 = !DILocation(line: 47, column: 6, scope: !67)
!75 = !DILocation(line: 47, column: 9, scope: !67)
!76 = !DILocation(line: 48, column: 8, scope: !67)
!77 = !DILocation(line: 48, column: 6, scope: !67)
!78 = !DILocation(line: 49, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !67, file: !3, line: 49, column: 5)
!80 = !DILocation(line: 49, column: 5, scope: !79)
!81 = !DILocation(line: 49, column: 5, scope: !67)
!82 = !DILocation(line: 51, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 50, column: 2)
!84 = !DILocation(line: 52, column: 2, scope: !83)
!85 = !DILocation(line: 53, column: 9, scope: !67)
!86 = !DILocation(line: 53, column: 2, scope: !67)
