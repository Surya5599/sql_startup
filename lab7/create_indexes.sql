CREATE INDEX idx_nyc_part_num
ON part_nyc (part_number);

CREATE INDEX idx_nyc_on_hand
ON part_nyc (on_hand);

CREATE INDEX idx_nyc_supplier
ON part_nyc (supplier);

CREATE INDEX idx_nyc_color
ON part_nyc (color);

CREATE INDEX idx_sfo_part_num
ON part_sfo (part_number);

CREATE INDEX idx_sfo_on_hand
ON part_sfo (on_hand);

CREATE INDEX idx_sfo_supplier
ON part_sfo (supplier);

CREATE INDEX idx_sfo_color
ON part_sfo (color);

CREATE INDEX idx_supplier_name
ON supplier (supplier_name);

CREATE INDEX idx_supplier_id
ON supplier (supplier_id);

CREATE INDEX idx_color_name
ON color (color_name);

CREATE INDEX idx_color_id
ON color (color_id);


