import "package:flutter/material.dart";
/// MultiBlocListener :
/// It is a widget provided by flutter_bloc library. It merges multiple BlocListener widget into one and
/// hence improves the readability of code.
/// CODE:
/// MultiBlocListener(
/// listeners: [
/// BlocListener<BlocA, BlocAState>(
/// listener: (context, state) {},
/// ),
/// BlocListener<BlocB, BlocBState>(
/// listener: (context, state) {},
/// ),
/// BlocListener<BlocC, BlocCState>(
/// listener: (context, state) {},
/// ),
/// ],
/// child: ChildA(),
/// )


/// MultiRepositoryProvider :
/// It is a widget provided by flutter_bloc library. It merges multiple RepositoryProvider widget into one
/// and hence improves the readability of code.
/// CODE:
/// MultiRepositoryProvider(
/// providers: [
/// RepositoryProvider<RepositoryA>(
/// create: (context) { return RepositoryA(); },
/// ),
/// RepositoryProvider<RepositoryB>(
/// create: (context) { return RepositoryB(); },
/// ),
/// RepositoryProvider<RepositoryC>(
/// create: (context) { return RepositoryC(); },
/// ),
/// ],
/// child: ChildA(),
/// ),