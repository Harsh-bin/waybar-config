
# Waybar Config — Clean Waybar setup

## Main Highlight
**Todo and countdown module**
---
[todo-lists](https://github.com/Harsh-bin/waybar-todo-lists)
![todo-lists](preview/img/todo.png)

[waybar-countdown](https://github.com/Harsh-bin/waybar-countdown)
![Countdown](preview/img/countdown.png)

---

## Preview
**Rofi and waybar themes**

![Style 1](preview/img/style_1.png)

![Style 2](preview/img/style_2.png)

![Style 3](preview/img/style_3.png)

![Style 4](preview/img/style_4.png)

![Style 5](preview/img/style_5.png)

![Style 6](preview/img/style_6.png)

![Style 7](preview/img/style_7.png)

![Style 8](preview/img/style_8.png)

![Style 9](preview/img/style_9.png)

![Style 10](preview/img/style_10.png)

![Style 11](preview/img/style_11.png)

## Install 
```
git clone https://github.com/Harsh-bin/waybar-config.git
cd waybar-config
chmod +x ./install.sh
./install.sh
```
This is important: configuration relies on the `Foot terminal`, you must either install it or update configuration to use a different terminal emulator.

## Included scripts overview

- `lock.sh` — lock screen helper required [swaylock-effects](https://github.com/mortie/swaylock-effects)
- `power.sh` — uses zenity to show menu (shutdown, reboot, logout) `logout cmd is configured for labwc modify this according to your DE`
- `theme.sh` — cycle through the waybar themes on right clicking the menu module
- `countdown.sh` — used by the `custom/countdown` module
- `todo.sh` and `todo_tui.sh` — used by the `custom/todo` module

