import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/route_generator.dart';

Builder jrouteBuilder(BuilderOptions options) => LibraryBuilder(RouteGenerator(),
    generatedExtension: '.internal_invalid.dart');

Builder jrouteRootBuilder(BuilderOptions options) =>
    LibraryBuilder(RouteRootGenerator(),
        generatedExtension: '.internal.dart');
