module CSSOM.Main where

import Effect.Uncurried

import Effect (Effect)
import Prelude (Unit)

class HasRuleList a where
  getRuleList' :: a -> Effect CSSRuleList
  insertRule'  :: a -> String -> Effect Unit
  deleteRule'  :: a -> Int -> Effect Unit

class IsCSSRule a where
  getCssText :: a -> Effect String

type IndexedRule a
  = { id   :: Int
    , item :: a
    }

type CSSRules 
  = { styleRules     :: Array (IndexedRule CSSStyleRule)
    , importRules    :: Array (IndexedRule CSSImportRule)
    , mediaRules     :: Array (IndexedRule CSSMediaRule)
    , fontFaceRules  :: Array (IndexedRule CSSFontFaceRule)
    , pageRules      :: Array (IndexedRule CSSPageRule)
    , keyframesRules :: Array (IndexedRule CSSKeyframesRule)
    , keyframeRules  :: Array (IndexedRule CSSKeyframeRule)
    } 

---

foreign import data CSSStyleSheet    :: Type

foreign import createStyleTagJS 
  :: EffectFn1 String CSSStyleSheet

instance hasRuleListCSSStyleSheet :: HasRuleList CSSStyleSheet where
  getRuleList' = runEffectFn1 getStyleSheetRuleListJS
  insertRule'  = runEffectFn2 insertRuleJS
  deleteRule'  = runEffectFn2 deleteRuleJS

-- | Get all the rules of a stylesheet, split by type
foreign import getStyleSheetRuleListJS
  :: EffectFn1 CSSStyleSheet CSSRuleList 

-- | Insert a style rule into a stylesheet via string
foreign import insertRuleJS 
  :: EffectFn2 CSSStyleSheet String Unit

--- | Delete a style rule from a stylesheet by its Id
foreign import deleteRuleJS
  :: EffectFn2 CSSStyleSheet Int Unit
  
---

foreign import data CSSMediaRule     :: Type

instance hasRuleListCSSMediaRule :: HasRuleList CSSMediaRule where
  getRuleList' = runEffectFn1 getMediaRuleRuleListJS
  insertRule'  = runEffectFn2 insertMediaRuleRuleJS
  deleteRule'  = runEffectFn2 deleteMediaRuleRuleJS

instance isCSSRuleCSSMediaRule :: IsCSSRule CSSMediaRule where
 getCssText   = runEffectFn1 getMediaRuleCSSTextJS

-- | Delete a style that applies to a media rule only
foreign import deleteMediaRuleRuleJS
  :: EffectFn2 CSSMediaRule Int Unit

-- | Insert a style that applies to a media rule only
foreign import insertMediaRuleRuleJS
  :: EffectFn2 CSSMediaRule String Unit

-- | Get all the rules of a stylesheet, split by type
foreign import getMediaRuleRuleListJS
  :: EffectFn1 CSSMediaRule CSSRuleList

-- | Get the rule from the Media Rule
foreign import getMediaRuleMediaTextJS
  :: EffectFn1 CSSMediaRule String

foreign import getMediaRuleCSSTextJS
  :: EffectFn1 CSSMediaRule String

---

foreign import data CSSStyleRule     :: Type

instance isCSSRuleCSSStyleRule :: IsCSSRule CSSStyleRule where
 getCssText   = runEffectFn1 getStyleRuleCSSTextJS

-- | Get the selector text of a CSSStyleRule
foreign import getStyleRuleSelectorTextJS
  :: EffectFn1 CSSStyleRule String

-- | Get the Style Declaration of a CSSStyleRule
foreign import getStyleRuleDeclarationTextJS
  :: EffectFn1 CSSStyleRule String

foreign import getStyleRuleCSSTextJS
  :: EffectFn1 CSSStyleRule String

---

foreign import data CSSImportRule    :: Type

instance isCSSRuleCSSImportRule :: IsCSSRule CSSImportRule where
 getCssText   = runEffectFn1 getImportRuleCSSTextJS

foreign import getImportRuleCSSTextJS
  :: EffectFn1 CSSImportRule String

---

foreign import data CSSFontFaceRule  :: Type

instance isCSSRuleCSSFontFaceRule :: IsCSSRule CSSFontFaceRule where
 getCssText   = runEffectFn1 getFontFaceRuleCSSTextJS

foreign import getFontFaceRuleCSSTextJS
  :: EffectFn1 CSSFontFaceRule String

---

foreign import data CSSPageRule      :: Type

instance isCSSRuleCSSPageRule :: IsCSSRule CSSPageRule where
 getCssText   = runEffectFn1 getPageRuleCSSTextJS

foreign import getPageRuleCSSTextJS
  :: EffectFn1 CSSPageRule String

---

foreign import data CSSKeyframesRule :: Type

instance isCSSRuleCSSKeyframesRule :: IsCSSRule CSSKeyframesRule where
 getCssText   = runEffectFn1 getKeyframesRuleCSSTextJS

foreign import getKeyframesRuleCSSTextJS
  :: EffectFn1 CSSKeyframesRule String

---

foreign import data CSSKeyframeRule  :: Type

instance isCSSRuleCSSKeyframeRule :: IsCSSRule CSSKeyframeRule where
 getCssText   = runEffectFn1 getKeyframeRuleCSSTextJS

foreign import getKeyframeRuleCSSTextJS
  :: EffectFn1 CSSKeyframeRule String


---

foreign import data CSSRuleList      :: Type

-- | Get all the rules of a media rule, split by type
foreign import getFilteredRuleListJS 
  :: EffectFn1 CSSRuleList CSSRules

