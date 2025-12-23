import 'package:latlong2/latlong.dart';

class GridAStar {
  final LatLngBounds bounds;
  final int rows;
  final int cols;
  final Distance _dist = Distance();

  GridAStar(this.bounds, {this.rows = 80, this.cols = 80});

  List<LatLng> findPath(LatLng start, LatLng goal) {
    final startIdx = _toIndex(start);
    final goalIdx = _toIndex(goal);

    final open = <_Node>[];
    final closed = <String, _Node>{};

    _Node startNode =
        _Node(startIdx[0], startIdx[1], g: 0, h: _heuristic(startIdx, goalIdx));
    open.add(startNode);

    while (open.isNotEmpty) {
      open.sort((a, b) => a.f.compareTo(b.f));
      final current = open.removeAt(0);
      final key = '${current.r}_${current.c}';
      if (closed.containsKey(key)) continue;
      closed[key] = current;

      if (current.r == goalIdx[0] && current.c == goalIdx[1]) {
        return _reconstructPath(current);
      }

      for (final n in _neighbors(current)) {
        final nKey = '${n.r}_${n.c}';
        if (closed.containsKey(nKey)) continue;

        final tentativeG = current.g + _costBetween(current, n);
        final existing = open.firstWhere((x) => x.r == n.r && x.c == n.c,
            orElse: () => null);
        if (existing == null || tentativeG < existing.g) {
          n.g = tentativeG;
          n.h = _heuristic([n.r, n.c], goalIdx);
          n.parent = current;
          if (existing == null) open.add(n);
        }
      }
    }

    return <LatLng>[];
  }

  double _heuristic(List<int> a, List<int> b) {
    final aLatLng = _toLatLng(a);
    final bLatLng = _toLatLng(b);
    return _dist.as(LengthUnit.Meter, aLatLng, bLatLng);
  }

  double _costBetween(_Node a, _Node b) {
    final aLatLng = _toLatLng([a.r, a.c]);
    final bLatLng = _toLatLng([b.r, b.c]);
    return _dist.as(LengthUnit.Meter, aLatLng, bLatLng);
  }

  List<_Node> _neighbors(_Node node) {
    final res = <_Node>[];
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;
        final nr = node.r + dr;
        final nc = node.c + dc;
        if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
        res.add(_Node(nr, nc));
      }
    }
    return res;
  }

  List<LatLng> _reconstructPath(_Node node) {
    final rev = <LatLng>[];
    _Node? cur = node;
    while (cur != null) {
      rev.add(_toLatLng([cur.r, cur.c]));
      cur = cur.parent;
    }
    return rev.reversed.toList();
  }

  List<int> _toIndex(LatLng p) {
    final latFrac = (p.latitude - bounds.south) / (bounds.north - bounds.south);
    final lngFrac = (p.longitude - bounds.west) / (bounds.east - bounds.west);
    int r = (rows - 1 - (latFrac * (rows - 1))).clamp(0, rows - 1).toInt();
    int c = (lngFrac * (cols - 1)).clamp(0, cols - 1).toInt();
    return [r, c];
  }

  LatLng _toLatLng(List<int> idx) {
    final r = idx[0];
    final c = idx[1];
    final lat = bounds.north - (r / (rows - 1)) * (bounds.north - bounds.south);
    final lng = bounds.west + (c / (cols - 1)) * (bounds.east - bounds.west);
    return LatLng(lat, lng);
  }
}

class _Node {
  final int r;
  final int c;
  double g;
  double h;
  _Node? parent;

  _Node(this.r, this.c,
      {this.g = double.infinity, this.h = double.infinity, this.parent});

  double get f => g + h;
}

class LatLngBounds {
  final double north;
  final double south;
  final double west;
  final double east;

  LatLngBounds(
      {required this.north,
      required this.south,
      required this.west,
      required this.east});
}
