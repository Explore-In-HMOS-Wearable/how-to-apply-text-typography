import { TextModel } from '../model/TextModel';

export function editTextData(data: TextModel, index: number): TextModel {
  const fontSizes: number[] = [15, 20, 30]
  const fontStyles: FontStyle[] = [FontStyle.Normal, FontStyle.Italic]
  const fontWeights: string[] = ['400', '500', '700', '900']
  const fontFamilies: string[] = ['roboto', 'HarmonyOS Sans' , 'playfair', 'lora']
  const fontColors: ResourceColor[] =
    ['#0000ff', '#FFFFE000', '#FFFF7100']
  const lineSpacings: number[] = [15, 25, 35]
  const lineHeights: number[] = [15, 25, 35]
  const overFlows: TextOverflow[] = [TextOverflow.Clip, TextOverflow.Ellipsis, TextOverflow.MARQUEE]
  const letterSpacings: number[] = [5, 7, 9]
  const textCases: TextCase[] = [TextCase.Normal, TextCase.LowerCase, TextCase.UpperCase]
  const textIndents: number[] = [15, 20, 25]
  let arrIndex: number = 0

  switch (index) {
    case 1:
      arrIndex = fontSizes.indexOf(data.desiredFont.size as number)
      data.desiredFont.size = fontSizes[(arrIndex + 1) % 3]
      data.text = `font size: ${data.desiredFont.size}`
      return data
    case 2:
      arrIndex = fontStyles.indexOf(data.desiredFont.style as number)
      data.desiredFont.style = fontStyles[(arrIndex + 1) % 2]
      data.text = `font style: ${data.desiredFont.style === 1 ? 'Italic' : 'Normal'}`
      return data
    case 3:
      arrIndex = fontFamilies.indexOf(data.desiredFont.family as string)
      data.desiredFont.family = fontFamilies[(arrIndex + 1) % 4]
      data.text = `font family\n${data.desiredFont.family}`
      return data
    case 4:
      arrIndex = fontWeights.indexOf(data.desiredFont.weight as string)
      data.desiredFont.weight = fontWeights[(arrIndex + 1) % 4]
      data.text = `font weight ${data.desiredFont.weight}`
      return data
    case 5:
      arrIndex = fontColors.indexOf(data.desiredFontColor)
      data.desiredFontColor = fontColors[(arrIndex + 1) % 3]
      arrIndex =  (arrIndex + 1) % 3
      data.text = `${arrIndex === 0 ? 'Blue ' : arrIndex === 1 ? 'Yellow' : 'Red'} font color`
      return data
    case 6:
      arrIndex = lineSpacings.indexOf(data.desiredLineSpacing)
      data.desiredLineSpacing = lineSpacings[(arrIndex + 1) % 3]
      data.text = `${data.desiredLineSpacing}\nChanged line spacing\nChanged line spacing`
      return data
    case 7:
      arrIndex = lineHeights.indexOf(data.desiredLineHeight)
      data.desiredLineHeight = lineHeights[(arrIndex + 1) % 3]
      data.text = `${data.desiredLineHeight}\nChanged line height\nChanged line height`
      return data
    case 8:
      arrIndex = overFlows.indexOf(data.desiredTextOverflow.overflow)
      data.desiredTextOverflow.overflow = overFlows[(arrIndex + 1) % 3]
      data.text =
        `Changed text overflow type ${data.desiredTextOverflow.overflow.toString() === '1' ? 'Clip cuts text directly based on text block size' :
          data.desiredTextOverflow.overflow.toString() === '2' ? 'Ellipsis give 3 dot to say it continues' : 'MARQUEE that means this text will slide horizontally' } `
      return data
    case 9:
      arrIndex = letterSpacings.indexOf(data.desiredLetterSpacing)
      data.desiredLetterSpacing = letterSpacings[(arrIndex + 1) % 3]
      data.text = `Changed letter spacing ${data.desiredLetterSpacing}`
      return data
    case 10:
      arrIndex = textCases.indexOf(data.desiredTextCase)
      data.desiredTextCase = textCases[(arrIndex + 1) % 3]
      data.text = `Changed text case to ${data.desiredTextCase === 1 ? 'lowercase' :
        data.desiredTextCase === 2 ? 'uppercase' : 'normal'}`
      return data
    case 11:
      arrIndex = textIndents.indexOf(data.desiredTextIndent)
      data.desiredTextIndent = textIndents[(arrIndex + 1) % 3]
      data.text = `Added indent\nIndent number ${data.desiredTextIndent}`
      return data

  }
  return data

}