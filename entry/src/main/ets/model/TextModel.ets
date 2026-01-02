export interface TextModel{
  text: string,
  desiredFont: Font,
  desiredFontColor: ResourceColor,
  desiredLineSpacing: number,
  desiredLineHeight: number,
  desiredTextOverflow: TextOverflowOptions,
  desiredLetterSpacing: number,
  desiredTextCase: TextCase,
  desiredTextIndent: number
}

export function createDefaultTextModel(): TextModel{
  return{
    text: 'test string',
    desiredFont: {size:15, weight: '100%', family: 'HarmonyOS Sans', style: FontStyle.Normal  },
    desiredFontColor: $r('app.color.default_text_color'),
    desiredLineSpacing: 0,
    desiredLineHeight: 0,
    desiredTextOverflow: { overflow: TextOverflow.None },
    desiredLetterSpacing: 0,
    desiredTextCase: TextCase.Normal,
    desiredTextIndent: 0
  }
}