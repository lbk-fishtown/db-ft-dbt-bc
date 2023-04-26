select
    quality,
    ph,
    residual_sugar,
    fixed_acidity,
    vitamin_c,
    density,
    chlorides,
    citric_acid,
    octyl_acetate,
    type,
    enzymes,
    sulphates,
    total_sulfur_dioxide,
    1 / pow(10, ph) as h_concentration,
    log(citric_acid / residual_sugar) as acidity_ratio
from {{ source("apjuice", "orange_quality") }}
