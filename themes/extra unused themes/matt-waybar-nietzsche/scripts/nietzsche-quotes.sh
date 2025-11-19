#!/bin/bash

# Nietzsche Quotes Script
# Displays a random quote from Friedrich Nietzsche

# Array of 20 Nietzsche quotes
quotes=(
    "What does not kill me, makes me stronger."
    "He who has a why to live can bear almost any how."
    "Without music, life would be a mistake."
    "And those who were seen dancing were thought to be insane by those who could not hear the music."
    "The individual has always had to struggle not to be overwhelmed by the tribe."
    "In every real man a child is hidden that wants to play."
    "You must have chaos within you to give birth to a dancing star."
    "The higher we soar the smaller we appear to those who cannot fly."
    "One must still have chaos in oneself to be able to give birth to a dancing star."
    "The man of knowledge must be able not only to love his enemies but also to hate his friends."
    "A casual stroll through the lunatic asylum shows that faith does not prove anything."
    "The thought of suicide is a great consolation: by means of it one gets through many a dark night."
    "To live is to suffer, to survive is to find some meaning in the suffering."
    "The advantage of a bad memory is that one enjoys several times the same good things for the first time."
    "It is not a lack of love, but a lack of friendship that makes unhappy marriages."
    "The snake which cannot cast its skin has to die."
    "A subject for a great poet would be God's boredom after the seventh day of creation."
    "All truly great thoughts are conceived while walking."
    "The most common lie is that which one lies to himself."
    "When you look into an abyss, the abyss also looks into you."
)

# Get random quote
quote="${quotes[$RANDOM % ${#quotes[@]}]}"

# Display the quote using notify-send with custom styling
notify-send -t 8000 -u normal \
    -i "~/.config/waybar/themes/matt-waybar-nietzsche/nietzsche.png" \
    "Friedrich Nietzsche" \
    "$quote"

# Alternative: Use rofi/wofi for a more interactive display
# echo "$quote" | rofi -dmenu -p "Nietzsche says:" -theme-str 'window {width: 60%;}'

