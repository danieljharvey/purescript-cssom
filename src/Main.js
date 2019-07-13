"use strict";

exports.getStyleSheetRuleListJS = function(stylesheet) {
  return stylesheet.cssRules;
}

exports.insertRuleJS = function(stylesheet, text) {
  if (stylesheet) {
    stylesheet.insertRule(text);
  }
}

exports.deleteRuleJS = function(stylesheet, index) {
  if (stylesheet) {
    stylesheet.deleteRule(index)
  }
}

exports.getStyleRuleSelectorTextJS = function(styleRule) {
  return styleRule.selectorText;
}

exports.getStyleRuleDeclarationTextJS = function(styleRule) {
  return styleRule.style.cssText;
}

exports.getStyleRuleCSSTextJS = function(styleRule) {
  return styleRule.cssText;
}

exports.insertMediaRuleRuleJS = function(mediaRule, text) {
  mediaRule.insertRule(text, 0);
}

exports.deleteMediaRuleRuleJS = function(mediaRule, index) {
  mediaRule.deleteRule(index)
}

exports.getMediaRuleRuleListJS = function(mediaRule) {
  return mediaRule.cssRules;
}

exports.getMediaRuleMediaTextJS = function(mediaRule) {
  return mediaRule.media.mediaText;
}

exports.getMediaRuleCSSTextJS = function(mediaRule) {
  return mediaRule.cssText
}

exports.getImportRuleCSSTextJS = function(importRule) {
  return importRule.cssText;
}

exports.getFontFaceRuleCSSTextJS = function(fontFaceRule) {
  return fontFaceRule.cssText
}

exports.getPageRuleCSSTextJS = function(pageRule) {
  return pageRule.cssText
}

exports.getKeyframesRuleCSSTextJS = function(keyframesRule) {
  return keyframesRule.cssText
}

exports.getKeyframeRuleCSSTextJS = function(keyframeRule) {
  return keyframeRule.cssText
}

exports.getFilteredRuleListJS = function(rules) {
  const allStyles = Object.keys(rules).map(function(j) {
    return { id: j
           , item: rules[j]
           }
  });

  return {
    styleRules: allStyles.filter(isStyleRule),
    importRules: allStyles.filter(isImportRule),
    mediaRules: allStyles.filter(isMediaRule),
    fontFaceRules: allStyles.filter(isFontFaceRule),
    pageRules: allStyles.filter(isPageRule),
    keyframesRules: allStyles.filter(isKeyframesRule),
    keyframeRules: allStyles.filter(isKeyframeRule)
  }
}

// helpers
//
const isStyleRule = function(a) {
  return a.item.type === 1
}

const isImportRule = function(a) {
  return a.item.type == 3
}

const isMediaRule = function(a) {
  return a.item.type === 4
}

const isFontFaceRule = function(a) {
  return a.item.type == 5
}

const isPageRule = function(a) {
  return a.item.type == 6
}

const isKeyframesRule = function(a) {
  return a.item.type == 7
}

const isKeyframeRule = function(a) {
  return a.item.type == 8
}

//

exports.createStyleTagJS = function(id) {
  var css = "";
  var head = document.head || document.getElementsByTagName("head")[0];
  var style = document.createElement("style");

  style.type = "text/css";
  style.id = id;
  if (style.styleSheet) {
    // This is required for IE8 and below.
    style.styleSheet.cssText = css;
  } else {
    style.appendChild(document.createTextNode(css));
  }

  head.appendChild(style);
  return findStylesheetById(document, id);
};

function findStylesheetById(_document, id) {
  var foundId = Object.keys(_document.styleSheets).find(function(i) {
    var sheet = _document.styleSheets[i];
    return sheet && sheet.ownerNode && sheet.ownerNode.id === id;
  });
  if (foundId) {
    return _document.styleSheets[foundId];
  } else {
    throw Error("oh no, could not find")
  }
};