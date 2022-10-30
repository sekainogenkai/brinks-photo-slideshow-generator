## Usage

1. Organize or photos into multiple directories within a folder.
   * There should be a single subfolder for each named group.
   * No nested subdirectories.
   * The image and video files should be named so that they are ordered when sorted by the [active collation](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_13_03).
   * Each subfolder should have a file named `id` with an [XML ID](https://www.w3.org/TR/REC-xml/#id) which will be the programatic identifier for that group.
   * Each subfolder should have a file named `name` with an XML fragment which shown as the heading for that group.
2. Copy the following files from this repository to the folder containing your subfolders:
   * `pictures.xhtml.foot`
   * `pictures.xhtml.head`
   * `generate.sh`
3. In bash, run `./generate.sh`
4. The results will be written to `pictures.xhtml`
