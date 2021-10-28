part of 'device_model.dart';

List<Widget> buildCustomDeviceTiles(BuildContext context) {
  final customDevice = context.select(
    (DevicePreviewStore store) => store.data.customDevice,
  );
  return [
    ToolPanelSection(
      title: 'Screen',
      icon: Icons.palette,
      children: [
        if (customDevice != null) ...[
          ListTile(
            title: const Text('Width'),
            trailing: Text(customDevice.screenSize.width.toString()),
            subtitle: Slider(
              value: customDevice.screenSize.width,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    screenSize: Size(v, customDevice.screenSize.height),
                  ),
                );
              },
              min: 128,
              max: 2688,
              divisions: 20,
            ),
          ),
          ListTile(
            title: const Text('Height'),
            trailing: Text(customDevice.screenSize.height.toString()),
            subtitle: Slider(
              value: customDevice.screenSize.height,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    screenSize: Size(customDevice.screenSize.width, v),
                  ),
                );
              },
              min: 128,
              max: 2688,
              divisions: 20,
            ),
          ),
          ListTile(
            title: const Text('Pixel ratio'),
            trailing: Text(customDevice.pixelRatio.toString()),
            subtitle: Slider(
              value: customDevice.pixelRatio,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    pixelRatio: v,
                  ),
                );
              },
              min: 1,
              max: 4,
              divisions: 3,
            ),
          ),
        ],
      ],
    ),
    ToolPanelSection(
      title: 'Safe areas',
      icon: Icons.palette,
      children: [
        if (customDevice != null) ...[
          ListTile(
            title: const Text('Left'),
            trailing: Text(customDevice.safeAreas.left.toString()),
            subtitle: Slider(
              value: customDevice.safeAreas.left,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    safeAreas: customDevice.safeAreas.copyWith(left: v),
                  ),
                );
              },
              min: 0,
              max: 128,
              divisions: 8,
            ),
          ),
          ListTile(
            title: const Text('Top'),
            trailing: Text(customDevice.safeAreas.top.toString()),
            subtitle: Slider(
              value: customDevice.safeAreas.top,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    safeAreas: customDevice.safeAreas.copyWith(top: v),
                  ),
                );
              },
              min: 0,
              max: 128,
              divisions: 8,
            ),
          ),
          ListTile(
            title: const Text('Right'),
            trailing: Text(customDevice.safeAreas.right.toString()),
            subtitle: Slider(
              value: customDevice.safeAreas.right,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    safeAreas: customDevice.safeAreas.copyWith(right: v),
                  ),
                );
              },
              min: 0,
              max: 128,
              divisions: 8,
            ),
          ),
          ListTile(
            title: const Text('Bottom'),
            trailing: Text(customDevice.safeAreas.bottom.toString()),
            subtitle: Slider(
              value: customDevice.safeAreas.bottom,
              onChanged: (v) {
                final store = context.read<DevicePreviewStore>();
                store.updateCustomDevice(
                  customDevice.copyWith(
                    safeAreas: customDevice.safeAreas.copyWith(bottom: v),
                  ),
                );
              },
              min: 0,
              max: 128,
              divisions: 8,
            ),
          ),
        ],
      ],
    ),
    ToolPanelSection(
      title: 'System',
      icon: Icons.palette,
      children: [
        ..._allPlatforms.map(
          (p) => ListTile(
            leading: TargetPlatformIcon(platform: p),
            title: Text(
              describeEnum(p),
            ),
            onTap: () {
              final store = context.read<DevicePreviewStore>();
              if (customDevice != null) {
                store.updateCustomDevice(
                  customDevice.copyWith(
                    platform: p,
                  ),
                );
              }
            },
          ),
        ),
      ],
    ),
    ToolPanelSection(
      title: 'Form factor',
      icon: Icons.palette,
      children: [
        ..._allDeviceTypes.map(
          (p) => ListTile(
            leading: Icon(p.typeIcon()),
            title: Text(
              describeEnum(p),
            ),
            onTap: () {
              final store = context.read<DevicePreviewStore>();
              if (customDevice != null) {
                store.updateCustomDevice(
                  customDevice.copyWith(
                    type: p,
                  ),
                );
              }
            },
          ),
        ),
      ],
    ),
  ];
}