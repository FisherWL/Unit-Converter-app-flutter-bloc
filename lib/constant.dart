import 'package:flutter/material.dart';

//
const Color darkGreen = Color(0XFF356859);
const Color oliveGreen = Color(0XFF37966F);
const Color lightGreen = Color(0XFFB9E4C9);
const Color lightYellow = Color(0XFFFFFBE6);
const Color darkYellow = Color(0xfff3efda);
const Color warmColor = Color(0xff96375e);
const Color lightWarm = Color(0xffffa4ca);

const Map<String, String> enGenreUnitsMap = {
  'weight': 'oz, lb, g, kg',
  'length': 'in, ft, km, m',
  'area': 'ft², mi², km², m²',
  'volume': 'fl oz, gal, mL, m³',
  'speed': 'kt, mph, m/s, km/h',
  'power': 'ft⋅lbf/s, hp, Btu/h, kW',
  'pressure': 'psi, atm, inHg, kPa',
  'acceleration': 'ft/s², km/hs, m/s²',
  'illumination': 'ph, flame, nox, lux',
  'luminance': 'asb, nit, lm/ft²sr, cd/m²',
  'torque': 'lbf⋅ft, dyn⋅m, kgf⋅m, N⋅m',
};

const Map<String, String> abbrMap = {
  "weight":
      "kilogram,gram,carat,milligram,microgram,tonne,troy ounce,ounce,pound",
  "length":
      "centimeter,meter,millimeter,micrometer,nanometer,kilometer,nautical mile,mile,yard,foot,inch",
  "area":
      "square meter,square millimeter,square centimeter,square kilometer,hectare,square mile,acre,square yard,square inch,square foot",
  "volume":
      "liter,milliliter,cubic centimeter,cubic meter,teaspoon,tablespoon,cup,cubic inch,cubic foot,imperial fluid ounce,fluid ounce(US),imperial pint,pint(US),imperial quart,quart(US),imperial gallon,gallon(US)",
  "speed":
      "kilometer per hour,meter per second,knot,foot per second,mile per hour",
  "power":
      "kilowatt,watt,foot·pounds per second,kilogram·meter per second,British thermal unit per Hour,metric horsepower,imperial horsepower",
  "pressure":
      "kilopascal,pascal,kilogram per square meter,pound per square inch,pound per square foot,inch of mercury,torr,standard atmosphere",
  "acceleration":
      "metres per second squared,kilometres per hour per second,feet per second squared,miles per hour per second,standard gravity,knots per second",
  "illumination":
      "lux,foot·candle,meter·candle,flame,lumen per square meter,phot,candela steradian per square meter,watt per square centimeter,nox",
  "luminance":
      "candela per square meter,foot·lambert,nit,lumen per square foot steradian,lambert,apostilb,skot,stilb,candela per square foot",
  "torque":
      "gram·force meter,kilogram·force meter,dyne meter,Newton meter,pound·force foot,pound·force inch,ounce·force foot,ounce·force inch",
};

const Map<String, Map<String, double>> coefficient = {
  'weight': {
    'kg': 1.0,
    'g': 1 / 1000,
    'ct': 0.2 / 1000,
    'mg': 1 / 1000000,
    'µg': 1 / 1000000000,
    't': 1000,
    'oz t': 31.1034768 / 1000,
    'oz': 453.59237 / 16000,
    'lb': 453.59237 / 1000
  },
  'length': {
    'cm': 1.0,
    'm': 100,
    'mm': 1 / 10,
    'µm': 1 / 10000,
    'nm': 1 / 10000000,
    'km': 100000,
    'nmi': 185200,
    'mi': 160934.4,
    'yd': 91.44,
    'ft': 30.48,
    'in': 2.54,
  },
  'area': {
    'm²': 1.0,
    'mm²': 0.000001,
    'cm²': 0.0001,
    'km²': 1000000,
    'ha': 10000,
    'mi²': 0.092903040 * 27878400,
    'ac': 0.092903040 * 43560,
    'yd²': 0.092903040 * 9,
    'in²': 0.092903040 / 144,
    'ft²': 0.092903040,
  },
  'volume': {
    'L': 1.0,
    'mL': 0.001,
    'cm³(cc)': 0.001,
    'm³': 1000,
    'tsp': 3.785411784 / 768,
    'Tbsp': 3.785411784 / 256,
    'cup': 3.785411784 / 16,
    'in³': 3.785411784 / 231,
    'ft³': 3.785411784 / 231 * 12 * 12 * 12,
    'fl-oz(UK)': 4.54609 / 160,
    'fl-oz(US)': 3.785411784 / 128,
    'pt-UK': 4.54609 / 8,
    'pt-US': 3.785411784 / 8,
    'qt-UK': 4.54609 / 4,
    'qt-US': 3.785411784 / 4,
    'gal-UK': 4.54609,
    'gal-US': 3.785411784,
  },
  'speed': {
    'km/h': 1.0,
    'm/s': 3.6,
    'kt': 1.852,
    'ft/s': 1.09728,
    'mph': 1.609344,
  },
  'power': {
    'kW': 1,
    'W': 1 / 1000,
    'ft⋅lbf/s': 1.3558179483 / 1000,
    'm⋅kgf/s': 9.80665 / 1000,
    'Btu/h': 0.0002930710702,
    'hp(m)': 0.73549875,
    'hp(i)': 0.7456998716,
  },
  'pressure': {
    'kPa': 1.0,
    'Pa': 1 / 1000,
    'kg/m²': 0.0098066520482,
    'psi': 6.8947590868,
    'psf': 6.8947590868 / 144,
    'inHg': 3.3863890189,
    'torr': 101325 / 760000,
    'atm': 101.32534,
  },
  'acceleration': {
    'm/s²': 1.0,
    'km/hs': 1000 / 3600,
    'ft/s²': 0.3048,
    'mph/s': 0.44704,
    'g₀': 9.80665,
    'kn/s': 1852 / 3600,
  },
  'illumination': {
    'lx': 1.0,
    'ft·c': 10.763910417,
    'm·c': 1.0,
    'flame': 43.055641667,
    'lm/m²': 1.0,
    'ph': 10000,
    'cd/m²': 1.0,
    'watt/cm²': 6830000,
    'nox': 0.001,
  },
  'luminance': {
    'cd/m²': 1.0,
    'fL': 1 / (3.141592653 * 0.3048 * 0.3048),
    'nt': 1.0,
    'lm/ft²sr': 1 / (0.3048 * 0.3048),
    'L': 10000 / 3.141592653,
    'asb': 1 / 3.141592653,
    'sk': 1 / (1000 * 3.141592653),
    'sb': 10000,
    'cd/ft²': 1 / (0.3048 * 0.3048),
  },
  'torque': {
    'gf·m': 1.0,
    'kgf·m': 1000,
    'dyn·m': 0.001019716213,
    'N·m': 101.9716213,
    'lbf·ft': 138.25495964,
    'lbf·in': 11.521246637,
    'ozf·ft': 8.6409348758,
    'ozf·in': 0.72007790632,
  },
};

Map<String, double> testCoeff = {
  'test': 1.0,
  'test2': 2.0,
  'test3': 3.0,
  'test4': 4.0,
};
