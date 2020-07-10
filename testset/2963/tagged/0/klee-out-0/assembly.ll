; ModuleID = './built-in.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.video_code = type { [16 x i8], i32, i8* }
%struct.video_code32 = type { [16 x i8], i32, i32 }
%union.anon = type { %struct.video_tuner }
%struct.video_tuner = type { i32, [32 x i8], i64, i64, i32, i16, i16 }

@cmd = dso_local global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @copy_from_user(i8* %to, i8* %from, i64 %n) #0 !dbg !14 {
est.bc-copy_from_user-0:
  %to.addr = alloca i8*, align 8
  %from.addr = alloca i8*, align 8
  %n.addr = alloca i64, align 8
  store i8* %to, i8** %to.addr, align 8
  store i8* %from, i8** %from.addr, align 8
  store i64 %n, i64* %n.addr, align 8
  ret i64 0, !dbg !19
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @get_microcode32(%struct.video_code* %kp, %struct.video_code32* %up) #0 !dbg !20 {
est.bc-get_microcode32-0:
  %kp.addr = alloca %struct.video_code*, align 8
  %up.addr = alloca %struct.video_code32*, align 8
  store %struct.video_code* %kp, %struct.video_code** %kp.addr, align 8
  store %struct.video_code32* %up, %struct.video_code32** %up.addr, align 8
  %0 = load %struct.video_code*, %struct.video_code** %kp.addr, align 8, !dbg !43
  %data = getelementptr inbounds %struct.video_code, %struct.video_code* %0, i32 0, i32 2, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !44
  %2 = load %struct.video_code32*, %struct.video_code32** %up.addr, align 8, !dbg !45
  %data1 = getelementptr inbounds %struct.video_code32, %struct.video_code32* %2, i32 0, i32 2, !dbg !46
  %3 = load i32, i32* %data1, align 4, !dbg !46
  %conv = zext i32 %3 to i64, !dbg !45
  %4 = inttoptr i64 %conv to i8*, !dbg !45
  %5 = load %struct.video_code32*, %struct.video_code32** %up.addr, align 8, !dbg !47
  %datasize = getelementptr inbounds %struct.video_code32, %struct.video_code32* %5, i32 0, i32 1, !dbg !48
  %6 = load i32, i32* %datasize, align 4, !dbg !48
  %conv2 = sext i32 %6 to i64, !dbg !47
  %call = call i64 @copy_from_user(i8* %1, i8* %4, i64 %conv2), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @caller(i64 %arg) #0 !dbg !51 {
est.bc-caller-0:
  %arg.addr = alloca i64, align 8
  %karg = alloca %union.anon, align 8
  %up = alloca i8*, align 8
  store i64 %arg, i64* %arg.addr, align 8
  %0 = load i64, i64* %arg.addr, align 8, !dbg !54
  %conv = trunc i64 %0 to i32, !dbg !54
  %call = call i8* @compat_ptr(i32 %conv), !dbg !55
  store i8* %call, i8** %up, align 8, !dbg !56
  %1 = load i32, i32* @cmd, align 4, !dbg !57
  switch i32 %1, label %est.bc-caller-2 [
    i32 1, label %est.bc-caller-1
  ], !dbg !58

est.bc-caller-1:                                  ; preds = %est.bc-caller-0
  %vc = bitcast %union.anon* %karg to %struct.video_code*, !dbg !59
  %2 = load i8*, i8** %up, align 8, !dbg !61
  %3 = bitcast i8* %2 to %struct.video_code32*, !dbg !61
  call void @get_microcode32(%struct.video_code* %vc, %struct.video_code32* %3), !dbg !62
  br label %est.bc-caller-2, !dbg !63

est.bc-caller-2:                                  ; preds = %est.bc-caller-1, %est.bc-caller-0
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @compat_ptr(i32 %uptr) #0 !dbg !65 {
est.bc-compat_ptr-0:
  %uptr.addr = alloca i32, align 4
  store i32 %uptr, i32* %uptr.addr, align 4
  %0 = load i32, i32* %uptr.addr, align 4, !dbg !68
  %conv = zext i32 %0 to i64, !dbg !69
  %1 = inttoptr i64 %conv to i8*, !dbg !70
  ret i8* %1, !dbg !71
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.ident = !{!10}
!llvm.module.flags = !{!11, !12, !13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cmd", scope: !2, file: !3, line: 9, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_710/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8)
!3 = !DIFile(filename: "test.c", directory: "/home/yizhuo/And-UBITect/testset/2963")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!"clang version 7.0.0 (tags/RELEASE_710/final)"}
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = distinct !DISubprogram(name: "copy_from_user", scope: !3, file: !3, line: 30, type: !15, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !6, !17, !7}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!19 = !DILocation(line: 32, column: 2, scope: !14)
!20 = distinct !DISubprogram(name: "get_microcode32", scope: !3, file: !3, line: 38, type: !21, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23, !35}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "video_code", file: !3, line: 19, size: 256, elements: !25)
!25 = !{!26, !31, !32}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "loadwhat", scope: !24, file: !3, line: 21, baseType: !27, size: 128)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 128, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 16)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "datasize", scope: !24, file: !3, line: 22, baseType: !9, size: 32, offset: 128)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !24, file: !3, line: 23, baseType: !33, size: 64, offset: 192)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "video_code32", file: !3, line: 25, size: 192, elements: !37)
!37 = !{!38, !39, !40}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "loadwhat", scope: !36, file: !3, line: 26, baseType: !27, size: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "datasize", scope: !36, file: !3, line: 27, baseType: !9, size: 32, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !36, file: !3, line: 28, baseType: !41, size: 32, offset: 160)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !3, line: 8, baseType: !42)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 40, column: 17, scope: !20)
!44 = !DILocation(line: 40, column: 21, scope: !20)
!45 = !DILocation(line: 40, column: 27, scope: !20)
!46 = !DILocation(line: 40, column: 31, scope: !20)
!47 = !DILocation(line: 40, column: 37, scope: !20)
!48 = !DILocation(line: 40, column: 41, scope: !20)
!49 = !DILocation(line: 40, column: 2, scope: !20)
!50 = !DILocation(line: 41, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "caller", scope: !3, file: !3, line: 42, type: !52, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{null, !7}
!54 = !DILocation(line: 47, column: 31, scope: !51)
!55 = !DILocation(line: 47, column: 20, scope: !51)
!56 = !DILocation(line: 47, column: 15, scope: !51)
!57 = !DILocation(line: 48, column: 9, scope: !51)
!58 = !DILocation(line: 48, column: 2, scope: !51)
!59 = !DILocation(line: 50, column: 26, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !3, line: 48, column: 13)
!61 = !DILocation(line: 50, column: 30, scope: !60)
!62 = !DILocation(line: 50, column: 4, scope: !60)
!63 = !DILocation(line: 51, column: 2, scope: !60)
!64 = !DILocation(line: 52, column: 1, scope: !51)
!65 = distinct !DISubprogram(name: "compat_ptr", scope: !3, file: !3, line: 34, type: !66, isLocal: true, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!6, !41}
!68 = !DILocation(line: 36, column: 39, scope: !65)
!69 = !DILocation(line: 36, column: 24, scope: !65)
!70 = !DILocation(line: 36, column: 9, scope: !65)
!71 = !DILocation(line: 36, column: 2, scope: !65)
