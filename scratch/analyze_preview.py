import json
from PIL import Image

image_path = "/var/folders/y1/mx_pbwks4lb3bbbm0972gkhr0000gn/T/ActionArtifacts/default/RenderPreview/RenderPreview_result_2026-05-27T232232Z@3x.png"
img = Image.open(image_path)
width, height = img.size
rgb_img = img.convert('RGB')

# T4 color is (230, 150, 34)
target_color = (230, 150, 34)
threshold = 30

print(f"Image size: {width}x{height}")

for y in range(0, height, 10):
    pink_xs = []
    for x in range(width):
        r, g, b = rgb_img.getpixel((x, y))
        dist = ((r - target_color[0])**2 + (g - target_color[1])**2 + (b - target_color[2])**2)**0.5
        if dist < threshold:
            pink_xs.append(x)
            
    if pink_xs:
        pink_xs.sort()
        groups = []
        if pink_xs:
            cur_group = [pink_xs[0]]
            for x in pink_xs[1:]:
                if x - cur_group[-1] <= 10:
                    cur_group.append(x)
                else:
                    groups.append(cur_group)
                    cur_group = [x]
            groups.append(cur_group)
            
        centers = [sum(g)/len(g) for g in groups]
        centers_str = ", ".join([f"{c:.1f} (width {len(g)})" for c, g in zip(centers, groups)])
        print(f"Row Y={y:04d}: {centers_str}")
