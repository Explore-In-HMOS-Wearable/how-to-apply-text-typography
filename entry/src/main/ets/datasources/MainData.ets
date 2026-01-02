import { TextModel } from '../model/TextModel';

export function fillTextData(data: Array<TextModel>) {

  data[0].text = 'Default text typology\nDefault line typology\nDefault Overflow is None text overflow type'

  data[1].desiredFont.size = 20
  data[1].text = `font size: ${data[1].desiredFont.size}`

  data[2].desiredFont.style = FontStyle.Normal
  data[2].text = `font style: ${data[2].desiredFont.style === 1 ? 'Italic' : 'Normal'}`

  data[3].desiredFont.family = 'HarmonyOS Sans'
  data[3].text = `font family\n${data[3].desiredFont.family}`

  data[4].desiredFont.weight = '500'
  data[4].text = `font weight ${data[4].desiredFont.weight}`

  data[5].desiredFontColor = '#0000ff'
  data[5].text = 'Blue font color'

  data[6].desiredLineSpacing = 35
  data[6].text = `${data[6].desiredLineSpacing}\nChanged line spacing\nChanged line spacing`

  data[7].desiredLineHeight = 35
  data[7].text = `${data[7].desiredLineHeight}\nChanged line height\nChanged line height`

  data[8].desiredTextOverflow = { overflow: TextOverflow.MARQUEE }
  data[8].text = 'Changed text overflow type MARQUEE that means this text will slide horizontally'

  data[9].desiredLetterSpacing = 5
  data[9].text = `Changed letter spacing ${data[9].desiredLetterSpacing}`

  data[10].desiredTextCase = TextCase.UpperCase
  data[10].text = `Changed text Case to ${data[10].desiredTextIndent === 1 ? 'lowercase' :
    data[10].desiredTextIndent === 2 ? 'uppercase' : 'normal'}`

  data[11].desiredTextIndent = 0
  data[11].text = `Added indent\nNo indent for next lines ${data[11].desiredTextIndent}`

}