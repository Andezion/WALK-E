import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({super.key});

  @override
  _CustomizationScreenState createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  int selectedBackground = 0;
  int selectedBadge = 0;
  int selectedFrame = 0;
  String selectedTheme = 'Purple';
  int selectedAvatar = 0;

  final List<Map<String, dynamic>> themes = [
    {'name': 'Purple', 'colors': [Color(0xFF5E4CE6), Color(0xFF231971)]},
    {'name': 'Blue', 'colors': [Color(0xFF1E88E5), Color(0xFF0D47A1)]},
    {'name': 'Green', 'colors': [Color(0xFF43A047), Color(0xFF1B5E20)]},
    {'name': 'Orange', 'colors': [Color(0xFFF57C00), Color(0xFFE65100)]},
    {'name': 'Pink', 'colors': [Color(0xFFEC407A), Color(0xFF880E4F)]},
    {'name': 'Dark', 'colors': [Color(0xFF424242), Color(0xFF212121)]},
  ];

  final List<IconData> avatarIcons = [
    Icons.person,
    Icons.face,
    Icons.emoji_emotions,
    Icons.sentiment_satisfied,
    Icons.mood,
    Icons.psychology,
    Icons.self_improvement,
    Icons.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildAvatarSection(),
                    SizedBox(height: 24),
                    _buildThemeSection(),
                    SizedBox(height: 24),
                    _buildBackgroundsSection(),
                    SizedBox(height: 24),
                    _buildFramesSection(),
                    SizedBox(height: 24),
                    _buildBadgesSection(),
                    SizedBox(height: 24),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Customization',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_circle, color: AppColors.accent, size: 24),
              SizedBox(width: 12),
              Text(
                'Profile avatar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: themes.firstWhere((t) => t['name'] == selectedTheme)['colors'],
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.accent.withOpacity(0.1),
                      child: Icon(
                        avatarIcons[selectedAvatar],
                        color: AppColors.accent,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pick an icon',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.dark.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(avatarIcons.length, (i) {
              final isSelected = selectedAvatar == i;
              return GestureDetector(
                onTap: () => setState(() => selectedAvatar = i),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.accent.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected ? AppColors.accent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    avatarIcons[i],
                    color: isSelected ? AppColors.accent : AppColors.dark.withOpacity(0.5),
                    size: 30,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette, color: AppColors.accent, size: 24),
              SizedBox(width: 12),
              Text(
                'Application topic',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: themes.length,
            itemBuilder: (context, i) {
              final theme = themes[i];
              final isSelected = selectedTheme == theme['name'];
              return GestureDetector(
                onTap: () {
                  setState(() => selectedTheme = theme['name']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Theme "${theme['name']}" picked!'),
                      backgroundColor: theme['colors'][0],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: theme['colors'],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: theme['colors'][0].withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                        : [],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          theme['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: theme['colors'][0],
                              size: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundsSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wallpaper, color: AppColors.accent, size: 24),
              SizedBox(width: 12),
              Text(
                'Profile backgrounds',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(6, (i) {
              final isSelected = selectedBackground == i;
              final gradients = [
                [Color(0xFF5E4CE6), Color(0xFF231971)],
                [Color(0xFFFF6B6B), Color(0xFFEE5A6F)],
                [Color(0xFF4ECDC4), Color(0xFF44A08D)],
                [Color(0xFFF093FB), Color(0xFFF5576C)],
                [Color(0xFF4FACFE), Color(0xFF00F2FE)],
                [Color(0xFFFA709A), Color(0xFFFEE140)],
              ];
              return GestureDetector(
                onTap: () {
                  setState(() => selectedBackground = i);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Fon ${i + 1} picked'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradients[i],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: gradients[i][0].withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                        : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: isSelected
                      ? Icon(Icons.check_circle, color: Colors.white, size: 32)
                      : null,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFramesSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.photo_size_select_actual, color: AppColors.accent, size: 24),
              SizedBox(width: 12),
              Text(
                'Profile frames',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(8, (i) {
              final isSelected = selectedFrame == i;
              final colors = [
                Colors.purple,
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.red,
                Colors.pink,
                Colors.teal,
                Colors.amber,
              ];
              return GestureDetector(
                onTap: () {
                  setState(() => selectedFrame = i);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Frame ${i + 1} selected'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: colors[i].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? colors[i] : colors[i].withOpacity(0.3),
                      width: isSelected ? 3 : 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      isSelected ? Icons.check_circle : Icons.photo_size_select_actual_outlined,
                      color: colors[i],
                      size: 28,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.military_tech, color: AppColors.accent, size: 24),
              SizedBox(width: 12),
              Text(
                'Achievement badges',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(8, (i) {
              final isSelected = selectedBadge == i;
              final badges = [
              {'icon': Icons.star, 'name': 'Star', 'color': Colors.amber},
              {'icon': Icons.local_fire_department, 'name': 'Fire', 'color': Colors.orange},
              {'icon': Icons.emoji_events, 'name': 'Cup', 'color': Colors.yellow},
              {'icon': Icons.favorite, 'name': 'Heart', 'color': Colors.red},
              {'icon': Icons.eco, 'name': 'Eco', 'color': Colors.green},
              {'icon': Icons.flash_on, 'name': 'Lightning', 'color': Colors.blue},
              {'icon': Icons.diamond, 'name': 'Diamond', 'color': Colors.cyan},
              {'icon': Icons.workspace_premium, 'name': 'Premium', 'color': Colors.purple},
              ];
              return GestureDetector(
                onTap: () {
                  setState(() => selectedBadge = i);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Badges "${badges[i]['name']}" picked'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (badges[i]['color'] as Color).withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? (badges[i]['color'] as Color)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        badges[i]['icon'] as IconData,
                        color: badges[i]['color'] as Color,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        badges[i]['name'] as String,
                        style: TextStyle(
                          color: AppColors.dark,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.accent, AppColors.deep],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.4),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                title: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 28),
                    SizedBox(width: 12),
                    Text('Saved!'),
                  ],
                ),
                content: Text('All customization settings applied.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ОК',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              'Save changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}