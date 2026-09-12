import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/property_location_entity.dart';
import 'map_marker_widget.dart';
import 'map_property_card.dart';

class PropertyMapWidget extends StatefulWidget {
  final List<PropertyLocationEntity> properties;
  final PropertyLocationEntity? selectedProperty;
  final ValueChanged<PropertyLocationEntity>? onPropertySelected;
  final bool showControls;
  final bool showCard;
  final double initialZoom;
  const PropertyMapWidget({
    super.key,
    required this.properties,
    this.selectedProperty,
    this.onPropertySelected,
    this.showControls = true,
    this.showCard = true,
    this.initialZoom = 13.0,
  });

  @override
  State<PropertyMapWidget> createState() => _PropertyMapWidgetState();
}

class _PropertyMapWidgetState extends State<PropertyMapWidget> {
  late final MapController _mapController;
  PropertyLocationEntity? _activeProperty;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _activeProperty = widget.selectedProperty ??
        (widget.properties.isNotEmpty ? widget.properties.first : null);
  }

  @override
  void didUpdateWidget(covariant PropertyMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedProperty != oldWidget.selectedProperty) {
      setState(() {
        _activeProperty = widget.selectedProperty;
      });
      if (_activeProperty != null && _activeProperty!.hasValidCoordinates) {
        _recenterTo(_activeProperty!.latitude, _activeProperty!.longitude);
      }
    }
  }

  void _recenterTo(double lat, double lng, {double? zoom}) {
    _mapController.move(LatLng(lat, lng), zoom ?? widget.initialZoom);
  }

  void _zoomIn() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom + 1);
  }

  void _zoomOut() {
    final currentZoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, currentZoom - 1);
  }

  @override
  Widget build(BuildContext context) {
    final initialCenter = _activeProperty != null && _activeProperty!.hasValidCoordinates
        ? LatLng(_activeProperty!.latitude, _activeProperty!.longitude)
        : (widget.properties.isNotEmpty && widget.properties.first.hasValidCoordinates
            ? LatLng(widget.properties.first.latitude, widget.properties.first.longitude)
            : const LatLng(30.0444, 31.2357)); // Default: Cairo / Giza

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: widget.initialZoom,
            minZoom: 3.0,
            maxZoom: 19.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.real_estate',
            ),
            MarkerLayer(
              markers: widget.properties.map((property) {
                final isSelected = _activeProperty?.id == property.id;
                return Marker(
                  point: LatLng(property.latitude, property.longitude),
                  width: 110,
                  height: 60,
                  child: MapMarkerWidget(
                    property: property,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _activeProperty = property;
                      });
                      _recenterTo(property.latitude, property.longitude);
                      if (widget.onPropertySelected != null) {
                        widget.onPropertySelected!(property);
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),

        // Zoom & Recenter controls
        if (widget.showControls)
          Positioned(
            right: 16,
            top: 20,
            child: Column(
              children: [
                _buildControlButton(
                  icon: Icons.add,
                  onTap: _zoomIn,
                ),
                const SizedBox(height: 8),
                _buildControlButton(
                  icon: Icons.remove,
                  onTap: _zoomOut,
                ),
                const SizedBox(height: 8),
                _buildControlButton(
                  icon: Icons.my_location,
                  onTap: () {
                    if (_activeProperty != null && _activeProperty!.hasValidCoordinates) {
                      _recenterTo(_activeProperty!.latitude, _activeProperty!.longitude);
                    }
                  },
                ),
              ],
            ),
          ),

        // Bottom Property Details Card
        if (widget.showCard && _activeProperty != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: MapPropertyCard(
              property: _activeProperty!,
              onClose: () {
                setState(() {
                  _activeProperty = null;
                });
              },
            ),
          ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: AppColors.darkColor, size: 20),
          ),
        ),
      ),
    );
  }
}
