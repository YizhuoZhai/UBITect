; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.acpi_device_info = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @acpi_get_object_info(i32* %handle, %struct.acpi_device_info** %return_buffer) #0 !dbg !15 {
est.bc-acpi_get_object_info-0:
  %retval = alloca i32, align 4
  %handle.addr = alloca i32*, align 8
  %return_buffer.addr = alloca %struct.acpi_device_info**, align 8
  %info = alloca %struct.acpi_device_info*, align 8
  %valid = alloca i32, align 4
  store i32* %handle, i32** %handle.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %handle.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct.acpi_device_info** %return_buffer, %struct.acpi_device_info*** %return_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info*** %return_buffer.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32*, i32** %handle.addr, align 8, !dbg !30
  %tobool = icmp ne i32* %0, null, !dbg !30
  br i1 %tobool, label %est.bc-acpi_get_object_info-1, label %est.bc-acpi_get_object_info-2, !dbg !32

est.bc-acpi_get_object_info-1:                    ; preds = %est.bc-acpi_get_object_info-0
  %1 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8, !dbg !33
  %tobool1 = icmp ne %struct.acpi_device_info** %1, null, !dbg !33
  br i1 %tobool1, label %est.bc-acpi_get_object_info-3, label %est.bc-acpi_get_object_info-2, !dbg !34

est.bc-acpi_get_object_info-2:                    ; preds = %est.bc-acpi_get_object_info-1, %est.bc-acpi_get_object_info-0
  store i32 4097, i32* %retval, align 4, !dbg !35
  br label %est.bc-acpi_get_object_info-4, !dbg !35

est.bc-acpi_get_object_info-3:                    ; preds = %est.bc-acpi_get_object_info-1
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info** %info, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call noalias i8* @malloc(i64 8) #3, !dbg !39
  %2 = bitcast i8* %call to %struct.acpi_device_info*, !dbg !39
  store %struct.acpi_device_info* %2, %struct.acpi_device_info** %info, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %valid, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 0, i32* %valid, align 4, !dbg !41
  %3 = load i32, i32* %valid, align 4, !dbg !42
  %4 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !43
  %valid2 = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %4, i32 0, i32 0, !dbg !44
  store i32 %3, i32* %valid2, align 4, !dbg !45
  %5 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !46
  %6 = load %struct.acpi_device_info**, %struct.acpi_device_info*** %return_buffer.addr, align 8, !dbg !47
  store %struct.acpi_device_info* %5, %struct.acpi_device_info** %6, align 8, !dbg !48
  store i32 32, i32* %retval, align 4, !dbg !49
  br label %est.bc-acpi_get_object_info-4, !dbg !49

est.bc-acpi_get_object_info-4:                    ; preds = %est.bc-acpi_get_object_info-3, %est.bc-acpi_get_object_info-2
  %7 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %7, !dbg !50
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xgene_ahci_probe(i32* %handle) #0 !dbg !51 {
est.bc-xgene_ahci_probe-0:
  %handle.addr = alloca i32*, align 8
  %version = alloca i32, align 4
  %status = alloca i32, align 4
  %info = alloca %struct.acpi_device_info*, align 8
  store i32* %handle, i32** %handle.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %handle.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %version, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 1, i32* %version, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata i32* %status, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.acpi_device_info** %info, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i32*, i32** %handle.addr, align 8, !dbg !62
  %call = call i32 @acpi_get_object_info(i32* %0, %struct.acpi_device_info** %info), !dbg !63
  store i32 %call, i32* %status, align 4, !dbg !64
  %1 = load i32, i32* %status, align 4, !dbg !65
  %tobool = icmp ne i32 %1, 0, !dbg !65
  br i1 %tobool, label %est.bc-xgene_ahci_probe-1, label %est.bc-xgene_ahci_probe-2, !dbg !67

est.bc-xgene_ahci_probe-1:                        ; preds = %est.bc-xgene_ahci_probe-0
  store i32 1, i32* %version, align 4, !dbg !68
  br label %est.bc-xgene_ahci_probe-2, !dbg !70

est.bc-xgene_ahci_probe-2:                        ; preds = %est.bc-xgene_ahci_probe-1, %est.bc-xgene_ahci_probe-0
  %2 = load %struct.acpi_device_info*, %struct.acpi_device_info** %info, align 8, !dbg !71
  %valid = getelementptr inbounds %struct.acpi_device_info, %struct.acpi_device_info* %2, i32 0, i32 0, !dbg !73
  %3 = load i32, i32* %valid, align 4, !dbg !73
  %and = and i32 %3, 32, !dbg !74
  %tobool1 = icmp ne i32 %and, 0, !dbg !74
  br i1 %tobool1, label %est.bc-xgene_ahci_probe-3, label %est.bc-xgene_ahci_probe-4, !dbg !75

est.bc-xgene_ahci_probe-3:                        ; preds = %est.bc-xgene_ahci_probe-2
  store i32 2, i32* %version, align 4, !dbg !76
  br label %est.bc-xgene_ahci_probe-4, !dbg !78

est.bc-xgene_ahci_probe-4:                        ; preds = %est.bc-xgene_ahci_probe-3, %est.bc-xgene_ahci_probe-2
  %4 = load i32, i32* %version, align 4, !dbg !79
  ret i32 %4, !dbg !80
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !8)
!1 = !DIFile(filename: "test.c", directory: "/data/home/yizhuo/And-UBITect/testset/8bce")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xgene_ahci_version", file: !1, line: 8, baseType: !4, size: 32, elements: !5)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !7}
!6 = !DIEnumerator(name: "XGENE_AHCI_V1", value: 1, isUnsigned: true)
!7 = !DIEnumerator(name: "XGENE_AHCI_V2", value: 2, isUnsigned: true)
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "acpi_status", file: !1, line: 3, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!15 = distinct !DISubprogram(name: "acpi_get_object_info", scope: !1, file: !1, line: 16, type: !16, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !25)
!16 = !DISubroutineType(types: !17)
!17 = !{!9, !18, !19}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "acpi_device_info", file: !1, line: 12, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "valid", scope: !21, file: !1, line: 13, baseType: !10, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !21, file: !1, line: 14, baseType: !10, size: 32, offset: 32)
!25 = !{}
!26 = !DILocalVariable(name: "handle", arg: 1, scope: !15, file: !1, line: 16, type: !18)
!27 = !DILocation(line: 16, column: 39, scope: !15)
!28 = !DILocalVariable(name: "return_buffer", arg: 2, scope: !15, file: !1, line: 16, type: !19)
!29 = !DILocation(line: 16, column: 73, scope: !15)
!30 = !DILocation(line: 17, column: 7, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !1, line: 17, column: 6)
!32 = !DILocation(line: 17, column: 14, scope: !31)
!33 = !DILocation(line: 17, column: 18, scope: !31)
!34 = !DILocation(line: 17, column: 6, scope: !15)
!35 = !DILocation(line: 18, column: 3, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 17, column: 33)
!37 = !DILocalVariable(name: "info", scope: !15, file: !1, line: 20, type: !20)
!38 = !DILocation(line: 20, column: 27, scope: !15)
!39 = !DILocation(line: 20, column: 34, scope: !15)
!40 = !DILocalVariable(name: "valid", scope: !15, file: !1, line: 21, type: !10)
!41 = !DILocation(line: 21, column: 6, scope: !15)
!42 = !DILocation(line: 22, column: 16, scope: !15)
!43 = !DILocation(line: 22, column: 2, scope: !15)
!44 = !DILocation(line: 22, column: 8, scope: !15)
!45 = !DILocation(line: 22, column: 14, scope: !15)
!46 = !DILocation(line: 23, column: 19, scope: !15)
!47 = !DILocation(line: 23, column: 3, scope: !15)
!48 = !DILocation(line: 23, column: 17, scope: !15)
!49 = !DILocation(line: 24, column: 2, scope: !15)
!50 = !DILocation(line: 25, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "xgene_ahci_probe", scope: !1, file: !1, line: 26, type: !52, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !25)
!52 = !DISubroutineType(types: !53)
!53 = !{!10, !18}
!54 = !DILocalVariable(name: "handle", arg: 1, scope: !51, file: !1, line: 26, type: !18)
!55 = !DILocation(line: 26, column: 27, scope: !51)
!56 = !DILocalVariable(name: "version", scope: !51, file: !1, line: 27, type: !3)
!57 = !DILocation(line: 27, column: 26, scope: !51)
!58 = !DILocalVariable(name: "status", scope: !51, file: !1, line: 29, type: !9)
!59 = !DILocation(line: 29, column: 14, scope: !51)
!60 = !DILocalVariable(name: "info", scope: !51, file: !1, line: 30, type: !20)
!61 = !DILocation(line: 30, column: 27, scope: !51)
!62 = !DILocation(line: 32, column: 32, scope: !51)
!63 = !DILocation(line: 32, column: 11, scope: !51)
!64 = !DILocation(line: 32, column: 9, scope: !51)
!65 = !DILocation(line: 33, column: 6, scope: !66)
!66 = distinct !DILexicalBlock(scope: !51, file: !1, line: 33, column: 6)
!67 = !DILocation(line: 33, column: 6, scope: !51)
!68 = !DILocation(line: 34, column: 11, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 33, column: 28)
!70 = !DILocation(line: 35, column: 2, scope: !69)
!71 = !DILocation(line: 36, column: 6, scope: !72)
!72 = distinct !DILexicalBlock(scope: !51, file: !1, line: 36, column: 6)
!73 = !DILocation(line: 36, column: 12, scope: !72)
!74 = !DILocation(line: 36, column: 18, scope: !72)
!75 = !DILocation(line: 36, column: 6, scope: !51)
!76 = !DILocation(line: 37, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 36, column: 36)
!78 = !DILocation(line: 38, column: 2, scope: !77)
!79 = !DILocation(line: 39, column: 9, scope: !51)
!80 = !DILocation(line: 39, column: 2, scope: !51)
