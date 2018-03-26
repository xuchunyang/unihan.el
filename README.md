# 使用 Unihan 数据库

[Unihan][unihan] 即 the Unicode Han Database，是 Unicode 整理的汉字数据库，提供了每个汉字的包括读音、笔画等各类信息。

[unihan]: http://www.unicode.org/charts/unihan.html

## 读音

    (unihan-readings ?中)
    
    =>
    
    ((kCantonese . "zung1 zung3")
     (kDefinition . "central; center, middle; in the midst of; hit (target); attain")
     (kHangul . "중")
     (kHanyuPinlu . "zhōng(4875) zhòng(66)")
     (kHanyuPinyin . "10028.100:zhōng,zhòng")
     (kJapaneseKun . "NAKA UCHI ATARU")
     (kJapaneseOn . "CHUU")
     (kKorean . "CWUNG")
     (kMandarin . "zhōng")
     (kTang . "*djiùng djiung")
     (kVietnamese . "trung"))

    (alist-get 'kHanyuPinyin (unihan-readings ?中))
         => "10028.100:zhōng,zhòng"
