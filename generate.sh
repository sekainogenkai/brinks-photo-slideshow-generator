#!/bin/sh
n=pictures.xhtml
newName="${n}.new"
cat "${n}.head" > "${newName}"
lastId=home
printf %s "<div id=\"${lastId}\"><div class=\"nav\">" >> "${newName}"
trailer="<h1>Pictures</h1></div>"
for d in *; do
    [ -d "${d}" ] || continue
    [ -f "${d}/id" ] || continue
    [ -f "${d}/name" ] || continue
    id="$(cat "${d}/id")"
    name="$(cat "${d}/name")"
    name=${name//&/&amp;}
    name=${name//</&lt;}
    printf %s "<a class=\"next\" href=\"#${id}\">next</a></div>${trailer}<div id=\"${id}\"><div class=\"nav\"><a class=\"prev\" href=\"#${lastId}\">previous</a>" >> "${newName}"
    trailer="<h2>${name}</h2></div>"
    lastId=${id}
    i=0
    for image in "${d}"/*; do
        # Ignore non-images
        suffix="${image##*.}"
        case "${suffix}" in
            [Jj][Pp][Gg]|[Jj][Pp][Ee][Gg]|[Mm][Pp]4)
                :
                ;;
            *)
                continue
                ;;
        esac
        # If no matches, will return the pattern itself
        [ -f "${image}" ] || continue
        caption="${image%%.*}"
        caption="${caption#*/}"
        [ -f "${image}.caption" ] && caption="$(cat "${image}.caption")"
        caption=${caption//&/&amp;}
        caption=${caption//</&lt;}
        imageId=${id}-${i}
        i=$((i + 1))
        printf %s "<a class=\"next\" href=\"#${imageId}\">next</a></div>${trailer}<div id=\"${imageId}\"><div class=\"nav\"><a class=\"prev\" href=\"#${lastId}\">previous</a>" >> "${newName}"
        if [ "${image##*.}" = mp4 ]; then
            trailer="<video controls=\"controls\" src=\"${image}\"/><div>${caption}</div><div> </div></div>
"
        else
            trailer="<img src=\"${image}\"/><div>${caption}</div><div> </div></div>
"
        fi
        lastId="${imageId}"
    done
done
printf %s "</div>${trailer}" >> "${newName}"
cat "${n}.foot" >> "${newName}"
mv "${newName}" "${n}"
