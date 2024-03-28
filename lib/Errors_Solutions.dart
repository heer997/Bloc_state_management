import "dart:io";

// Note: C:\Users\Administrator\AppData\Local\Pub\Cache\hosted\pub.dev\cloud_firestore-4.14.0\android\src\main\java\io\flutter\plugins\firebase\firestore\FlutterFirebaseFirestorePlugin.java uses or overrides a deprecated API.
// Note: Recompile with -Xlint:deprecation for details.
// Note: Some input files use unchecked or unsafe operations.
// Note: Recompile with -Xlint:unchecked for details.
// Note: Some input files use or override a deprecated API.
// Note: Recompile with -Xlint:deprecation for details.
/// ERROR:D8: Cannot fit requested classes in a single dex file (# methods: 112826 > 65536)
// com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
// The number of method references in a .dex file cannot exceed 64K.
// Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
// at com.android.builder.dexing.D8DexArchiveMerger.getExceptionToRethrow(D8DexArchiveMerger.java:151)
// at com.android.builder.dexing.D8DexArchiveMerger.mergeDexArchives(D8DexArchiveMerger.java:138)
// at com.android.build.gradle.internal.tasks.DexMergingWorkAction.merge(DexMergingTask.kt:859)
// at com.android.build.gradle.internal.tasks.DexMergingWorkAction.run(DexMergingTask.kt:805)
// at com.android.build.gradle.internal.profile.ProfileAwareWorkAction.execute(ProfileAwareWorkAction.kt:74)
// at org.gradle.workers.internal.DefaultWorkerServer.execute(DefaultWorkerServer.java:63)
// at org.gradle.workers.internal.NoIsolationWorkerFactory$1$1.create(NoIsolationWorkerFactory.java:66)
// at org.gradle.workers.internal.NoIsolationWorkerFactory$1$1.create(NoIsolationWorkerFactory.java:62)
// at org.gradle.internal.classloader.ClassLoaderUtils.executeInClassloader(ClassLoaderUtils.java:100)
// at org.gradle.workers.internal.NoIsolationWorkerFactory$1.lambda$execute$0(NoIsolationWorkerFactory.java:62)
// at org.gradle.workers.internal.AbstractWorker$1.call(AbstractWorker.java:44)
// at org.gradle.workers.internal.AbstractWorker$1.call(AbstractWorker.java:41)
// at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:204)
// at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:199)
// at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:66)
// at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:59)
// at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:157)
// at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:59)
// at org.gradle.internal.operations.DefaultBuildOperationRunner.call(DefaultBuildOperationRunner.java:53)
// at org.gradle.internal.operations.DefaultBuildOperationExecutor.call(DefaultBuildOperationExecutor.java:73)
// at org.gradle.workers.internal.AbstractWorker.executeWrappedInBuildOperation(AbstractWorker.java:41)
// at org.gradle.workers.internal.NoIsolationWorkerFactory$1.execute(NoIsolationWorkerFactory.java:59)
// at org.gradle.workers.internal.DefaultWorkerExecutor.lambda$submitWork$2(DefaultWorkerExecutor.java:212)
// at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
// at org.gradle.internal.work.DefaultConditionalExecutionQueue$ExecutionRunner.runExecution(DefaultConditionalExecutionQueue.java:187)
// at org.gradle.internal.work.DefaultConditionalExecutionQueue$ExecutionRunner.access$700(DefaultConditionalExecutionQueue.java:120)
// at org.gradle.internal.work.DefaultConditionalExecutionQueue$ExecutionRunner$1.run(DefaultConditionalExecutionQueue.java:162)
// at org.gradle.internal.Factories$1.create(Factories.java:31)
// at org.gradle.internal.work.DefaultWorkerLeaseService.withLocks(DefaultWorkerLeaseService.java:249)
// at org.gradle.internal.work.DefaultWorkerLeaseService.runAsWorkerThread(DefaultWorkerLeaseService.java:109)
// at org.gradle.internal.work.DefaultWorkerLeaseService.runAsWorkerThread(DefaultWorkerLeaseService.java:114)
// at org.gradle.internal.work.DefaultConditionalExecutionQueue$ExecutionRunner.runBatch(DefaultConditionalExecutionQueue.java:157)
// at org.gradle.internal.work.DefaultConditionalExecutionQueue$ExecutionRunner.run(DefaultConditionalExecutionQueue.java:126)
// at java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:539)
// at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
// at org.gradle.internal.concurrent.ExecutorPolicy$CatchAndRecordFailures.onExecute(ExecutorPolicy.java:64)
// at org.gradle.internal.concurrent.ManagedExecutorImpl$1.run(ManagedExecutorImpl.java:49)
// at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1136)
// at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:635)
// at java.base/java.lang.Thread.run(Thread.java:840)
// Caused by: com.android.tools.r8.CompilationFailedException: Compilation failed to complete, position: null
// at Version.fakeStackEntry(Version_3.3.70.java:0)
// at com.android.tools.r8.internal.Fj.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:75)
// at com.android.tools.r8.internal.Fj.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:28)
// at com.android.tools.r8.internal.Fj.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:27)
// at com.android.tools.r8.internal.Fj.b(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:2)
// at com.android.tools.r8.D8.run(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:11)
// at com.android.builder.dexing.D8DexArchiveMerger.mergeDexArchives(D8DexArchiveMerger.java:136)
// ... 38 more
// Caused by: com.android.tools.r8.internal.f: Cannot fit requested classes in a single dex file (# methods: 112826 > 65536)
// at com.android.tools.r8.internal.JT.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:14)
// at com.android.tools.r8.internal.JT.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:22)
// at com.android.tools.r8.internal.n30.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:524)
// at com.android.tools.r8.internal.i30.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:7)
// at com.android.tools.r8.internal.F2.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:371)
// at com.android.tools.r8.internal.F2.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:455)
// at com.android.tools.r8.D8.d(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:756)
// at com.android.tools.r8.D8.b(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:1)
// at com.android.tools.r8.internal.Fj.a(R8_3.3.70_49b71801b8b3de79ea68cec3bf950786c8f90f7a560cea4a2d23a82079b17d04:24)
// ... 41 more
//
//
// FAILURE: Build failed with an exception.
//
// * What went wrong:
// Execution failed for task ':app:mergeExtDexDebug'.
// > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingTaskDelegate
// > There was a failure while executing work items
// > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingWorkAction
// > com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
// The number of method references in a .dex file cannot exceed 64K.
// Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
//
// * Try:
// > Run with --stacktrace option to get the stack trace.
// > Run with --info or --debug option to get more log output.
// > Run with --scan to get full insights.
//
// * Get more help at https://help.gradle.org
//
// BUILD FAILED in 4m 1s
// [!] App requires Multidex support
// Multidex support is required for your android app to build since the number of methods has exceeded 64k. See https://docs.flutter.dev/deployment/android#enabling-multidex-support for more information. You may pass the --no-multidex flag to skip Flutter's multidex support to use a manual solution.
//
// Flutter tool can add multidex support. The following file will be added by flutter:
//
// android/app/src/main/java/io/flutter/app/FlutterMultiDexApplication.java
//
// cannot prompt without a terminal ui
// Error: Gradle task assembleDebug failed with exit code 1

/// SOLUTION : android->app->src->main->build.gradle -> minSdkVersion 21

/// Error 2 :
/// Error: ADB exited with exit code 1
/// Performing Streamed Install
//
// adb: failed to install D:\flutter_projects\androidstudioprojects\bloc_state_management\build\app\outputs\flutter-apk\app-debug.apk:
// Error launching application on Redmi Note 9 Pro Max.
/// SOLUTION : Unplug the cable and then re-run the Application in Mobile device OR Restart the Application.



/// In StackOverFlow :
/// Body :
// When try to run the flutter dart program on physical device mobile at that time below error will show sometimes in Android Studio terminal :
//
// Note: C:\Users\Administrator\AppData\Local\Pub\Cache\hosted\pub.dev\cloud_firestore-4.14.0\android\src\main\java\io\flutter\plugins\firebase\firestore\FlutterFirebaseFirestorePlugin.java uses or overrides a deprecated API.
// Note: Recompile with -Xlint:deprecation for details.
// Note: Some input files use unchecked or unsafe operations.
// Note: Recompile with -Xlint:unchecked for details.
// Note: Some input files use or override a deprecated API.
// Note: Recompile with -Xlint:deprecation for details.
// ERROR:D8: Cannot fit requested classes in a single dex file (# methods: 112826 > 65536)
// com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
// The number of method references in a .dex file cannot exceed 64K.
// Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
//
// FAILURE: Build failed with an exception.
//
// * What went wrong:
// Execution failed for task ':app:mergeExtDexDebug'.
// > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingTaskDelegate
// > There was a failure while executing work items
// > A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingWorkAction
// > com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
// The number of method references in a .dex file cannot exceed 64K.
// Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
//
// * Try:
// > Run with --stacktrace option to get the stack trace.
// > Run with --info or --debug option to get more log output.
// > Run with --scan to get full insights.
//
// * Get more help at https://help.gradle.org
//
// BUILD FAILED in 4m 1s
// [!] App requires Multidex support
// Multidex support is required for your android app to build since the number of methods has exceeded 64k. See https://docs.flutter.dev/deployment/android#enabling-multidex-support for more information. You may pass the --no-multidex flag to skip Flutter's multidex support to use a manual solution.
//
// Flutter tool can add multidex support. The following file will be added by flutter:
//
// android/app/src/main/java/io/flutter/app/FlutterMultiDexApplication.java
//
// cannot prompt without a terminal ui
// Error: Gradle task assembleDebug failed with exit code 1
//
// When the above Error show in the Android Studio Terminal at that time we should set minSdkVersion 21.
// There are two build.gradle files in Android Studio.
// 1st build.gradle file : 1st build.gradle file is located at android folder -> build.gradle.
// 2nd build.gradle file : 2nd build.gradle file is located at android folder -> app folder -> build.gradle.
//
// We have to select 2nd option from above shown options.
// In the app level build.gradle file, we have to set android { defaultConfig { minSdkVersion 21 } }.
// we have to set minSdkVersion 21 as shown above.
//
// After doing this, above Android Studio console problem will be solved.