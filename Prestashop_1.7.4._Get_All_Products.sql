SELECT 
p.`id_product`, 
p.`reference`  AS `reference`,
pl.`name` AS `product_name`,
GROUP_CONCAT(DISTINCT  cl.`name` SEPARATOR ', ') AS `categories`,
sa.`active`  AS `active`,
sav.physical_quantity AS `quantity`,
p.`price` AS `Base_price`,
p.`wholesale_price` AS `Sale_price`,
atrr.`ean13` AS `Barcode`,
m.`name` AS Brand,

-- Get Attributes by id and display them as a seperate column
IFNULL(MAX(CASE WHEN a.`id_attribute_group` = 1 THEN  pal.`name`  END), '') AS 'Μεγεθος',
IFNULL(MAX(CASE WHEN a.`id_attribute_group` = 2 THEN  pal.`name`  END), '') AS 'Μεγεθος EU',
IFNULL(MAX(CASE WHEN a.`id_attribute_group` = 5 THEN  pal.`name`  END), '') AS 'Χρώματα',

-- Get Image Url / Change the domain.gr with your domain
concat('https://domain.gr/', i.`id_image`, '/', p.`reference`,'.jpg') as `img_link`,

-- Get every feature as a different column 
IFNULL(MAX(CASE WHEN lf.`name` = 'Feature'              THEN fv.`value` END), '') AS 'Feature',
IFNULL(MAX(CASE WHEN lf.`name` = 'Μέγεθος UK'           THEN fv.`value` END), '') AS 'Μέγεθος UK',
IFNULL(MAX(CASE WHEN lf.`name` = 'Ύψος'                 THEN fv.`value` END), '') AS 'Ύψος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Μέγεθος US'           THEN fv.`value` END), '') AS 'Μέγεθος US',
IFNULL(MAX(CASE WHEN lf.`name` = 'Πλάτος'               THEN fv.`value` END), '') AS 'Πλάτος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Βάθος'                THEN fv.`value` END), '') AS 'Βάθος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Βάρος'                THEN fv.`value` END), '') AS 'Βάρος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Είδος'                THEN fv.`value` END), '') AS 'Είδος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Άθλημα - Χρήση'       THEN fv.`value` END), '') AS 'Άθλημα - Χρήση',
IFNULL(MAX(CASE WHEN lf.`name` = 'Ηλικία/Φύλο'          THEN fv.`value` END), '') AS 'Ηλικία/Φύλο',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Υποδήματος'     THEN fv.`value` END), '') AS 'Τύπος Υποδήματος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Ενδύματος'      THEN fv.`value` END), '') AS 'Τύπος Ενδύματος',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Αξεσουάρ'       THEN fv.`value` END), '') AS 'Τύπος Αξεσουάρ',
IFNULL(MAX(CASE WHEN lf.`name` = 'Υλικό'                THEN fv.`value` END), '') AS 'Υλικό',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Ποδοσφαιρικού'  THEN fv.`value` END), '') AS 'Τύπος Ποδοσφαιρικού',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Κάλτσας'        THEN fv.`value` END), '') AS 'Τύπος Κάλτσας',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Σαγιονάρας'     THEN fv.`value` END), '') AS 'Τύπος Σαγιονάρας',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Τσάντας'        THEN fv.`value` END), '') AS 'Τύπος Τσάντας',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Ζακέτας'        THEN fv.`value` END), '') AS 'Τύπος Ζακέτας',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Ισοθερμικού'    THEN fv.`value` END), '') AS 'Τύπος Ισοθερμικού',
IFNULL(MAX(CASE WHEN lf.`name` = 'Σετ Φόρμας'           THEN fv.`value` END), '') AS 'Σετ Φόρμας',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Μπουφάν'        THEN fv.`value` END), '') AS 'Τύπος Μπουφάν',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Μαγιό'          THEN fv.`value` END), '') AS 'Τύπος Μαγιό',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Κολάν'          THEN fv.`value` END), '') AS 'Τύπος Κολάν',
IFNULL(MAX(CASE WHEN lf.`name` = 'Σαιζόν'               THEN fv.`value` END), '') AS 'Σαιζόν',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος T-Shirt'        THEN fv.`value` END), '') AS 'Τύπος T-Shirt',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Φούτερ'         THEN fv.`value` END), '') AS 'Τύπος Φούτερ',
IFNULL(MAX(CASE WHEN lf.`name` = 'Τύπος Παντελονιού'    THEN fv.`value` END), '') AS 'Τύπος Παντελονιού',
IFNULL(MAX(CASE WHEN lf.`name` = 'Σειρά'                THEN fv.`value` END), '') AS 'Σειρά',
IFNULL(MAX(CASE WHEN lf.`name` = 'Shipping'             THEN fv.`value` END), '') AS 'Shipping',
IFNULL(MAX(CASE WHEN lf.`name` = 'Manufacturer'         THEN fv.`value` END), '') AS 'Manufacturer'  


FROM `ps_product` p -- product ID
INNER JOIN `ps_product_lang` pl ON p.`id_product` = pl.`id_product` -- Name
INNER JOIN `ps_category_product` cp ON p.`id_product` = cp.`id_product`  -- Product Categories ID
INNER JOIN `ps_category_lang` cl ON cp.`id_category` = cl.`id_category` -- Product Categories Name

LEFT JOIN `ps_product_shop` sa ON (p.`id_product` = sa.`id_product` AND sa.`id_shop` = 1) -- Product Status

LEFT JOIN `ps_product_attribute` atrr ON atrr.`id_product` = p.`id_product` -- Product EAN 
-- Product Image 
LEFT JOIN `ps_image_shop` image_shop ON (image_shop.`id_product` = p.`id_product` AND image_shop.`cover` = 1 AND image_shop.`id_shop` = 1)
LEFT JOIN `ps_image` i ON (i.`id_image` = image_shop.`id_image`)  
-- Product Attributes
LEFT JOIN `ps_product_attribute_combination` pac ON (atrr.`id_product_attribute` = pac.`id_product_attribute`)
LEFT JOIN `ps_attribute` a ON pac.`id_attribute` = a.`id_attribute`
LEFT JOIN `ps_attribute_lang` pal ON (pac.`id_attribute` = pal.`id_attribute`)
-- Product Features
LEFT JOIN `ps_feature_product` fp ON p.`id_product` = fp.`id_product`
LEFT JOIN `ps_feature_lang` lf ON fp.`id_feature` = lf.`id_feature`
LEFT JOIN `ps_feature_value_lang` fv ON fp.`id_feature_value` = fv.`id_feature_value`
-- Product Brand/Manufacturer
LEFT JOIN `ps_manufacturer` m ON p.`id_manufacturer` = m.`id_manufacturer`

LEFT JOIN `ps_stock_available` sav ON  pac.id_product_attribute = sav.id_product_attribute -- Product Quantity

-- Choose info only from lang = 1. 
WHERE pl.`id_lang` = 1 AND cl.`id_lang` = 1 AND pal.`id_lang` = 1 
-- Group products by reference id
GROUP BY atrr.`reference`
-- Order products by product id and attribute id
ORDER BY p.`id_product`, pac.`id_attribute`
-- Limit Result to 20 for first tries. Remove this line to get all products
limit 100
