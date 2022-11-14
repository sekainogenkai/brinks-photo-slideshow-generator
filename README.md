## Usage

1. Organize or photos into multiple directories within a folder.
   * There should be a single file `title` in the root folder which has an XML fragment which is used as the title.
   * There should be a single subfolder for each named group.
     * No nested subdirectories.
   * The image and video files should be named so that they are ordered when sorted by the [active collation](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_13_03).
     * To provide a caption for an image, create a file with an XHTML fragment named `«fullImageFilename».caption`. For example, the caption for an image named `IMG_1104.jpg`, create a file named `IMG_1104.jpg.caption`.
   * Each subfolder should have a file named `id` with an [XML ID](https://www.w3.org/TR/REC-xml/#id) which will be the programatic identifier for that group.
   * Each subfolder should have a file named `name` with an XML fragment which shown as the heading for that group.
2. In bash,
   1. Navigate to the folder.
   2. Run `~/path/to/repository/generate.sh`.
4. The results will be written to `pictures.xhtml`.
