
class JRouteRoot {
  const JRouteRoot();
}

class JRoute {
  final String desc;
  final String url;
  final List<JRouteAlias> alias;
  const JRoute({this.desc, this.url, this.alias});
}

class JRouteAlias {
  final String desc;
  final String url;
  const JRouteAlias({this.desc, this.url});
}
