for f in *.mp3 ; do
    ffmpeg -i "$f" -ab 128k -ac 2 -ar 44100 temp.mp3;
    mv -f temp.mp3 "$f";
done
