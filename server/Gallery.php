<?php


namespace Jumpers;


class Gallery
{
    public static function getScreenshotsPath($fileType)
        // png, jpg
    {
        $screenshots = [];
        $files = scandir('site/img/screenshots/' . $fileType);
        if ($files) {
            for ($i = 2; $i < count($files); $i++) {
                $screenshots[] = "site/img/screenshots/" . $fileType . '/' . $files[$i];
            }
        }
        if (empty($screenshots)) {
            throw new \Exception("can't get screenshots path");
        }
        return $screenshots;
    }
}