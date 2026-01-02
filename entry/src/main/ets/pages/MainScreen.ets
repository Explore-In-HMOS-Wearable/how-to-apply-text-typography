import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, CircleShape } from '@kit.ArkUI';
import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { createDefaultTextModel, TextModel } from '../model/TextModel';
import { LengthUnit } from '@kit.ArkUI';
import { fillTextData } from '../datasources/MainData';
import { editTextData } from '../datasources/DataEdit';

@Builder
function buildText() {
  Column() {
    Text('Common Typographies')
      .fontSize('60px')
      .fontWeight(FontWeight.Bold)
      .fontColor('#311E10')
  }.margin(0)
}

@Component
export default struct MainScreen {
  @Consume('pages') pages: NavPathStack;
  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
  private watchSize: string = '466px';
  @State textTypologies: Array<TextModel> = Array(12).fill(null).map(() => createDefaultTextModel())
  private funcReturn: TextModel = {
    text: 'test string',
    desiredFont: {size:15, weight: '100%', family: undefined, style: FontStyle.Normal  },
    desiredFontColor: $r('app.color.default_text_color'),
    desiredLineSpacing: 0,
    desiredLineHeight: 0,
    desiredTextOverflow: { overflow: TextOverflow.None },
    desiredLetterSpacing: 0,
    desiredTextCase: TextCase.Normal,
    desiredTextIndent: 0
  }
  private numb:number = 25



  async aboutToAppear() {
    this.context.getFont().registerFont({
      familyName: 'playfair',
      familySrc: $rawfile('playfair_display.ttf')
    })
    this.context.getFont().registerFont({
      familyName: 'lora',
      familySrc: $rawfile('lora.ttf')
    })
    this.context.getFont().registerFont({
      familyName: 'roboto',
      familySrc: $rawfile('roboto_condensed.ttf')
    })
    fillTextData(this.textTypologies)
  }

  @Builder
  listContinents() {
    Stack() {
      ArcList({ initialIndex: 0, header: this.tabBar1 }) {
        ForEach(this.textTypologies, (item: TextModel, index: number) => {
          ArcListItem() {
            Text(item.text)
              .font(item.desiredFont)
              .fontColor(item.desiredFontColor)
              .lineSpacing({value: item.desiredLineSpacing, unit: LengthUnit.PX})
              .lineHeight(item.desiredLineHeight)
              .textOverflow(item.desiredTextOverflow)
              .letterSpacing(item.desiredLetterSpacing)
              .textCase(item.desiredTextCase)
              .textIndent(item.desiredTextIndent)
              .padding(10)
              .backgroundColor('#EFEFEF')
              .borderWidth(3)
              .borderRadius(15)
              .maxLines(3)
              .onClick(() => {
                this.funcReturn = editTextData(item,index)
                this.textTypologies = [...this.textTypologies]
              })

          }.align(Alignment.Center)
          .width('75%')
        }, (item: TextModel, index: number) => (item.text).toString())


        ArcListItem() {
          Button('Reset typogrophies').onClick(() => {
            fillTextData(this.textTypologies)
            setTimeout(() => {
              this.textTypologies = [...this.textTypologies]
            }, 200);

          })
        }
      }
      .space(LengthMetrics.px(10))
      .borderRadius(this.watchSize)
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)

    }
    .align(Alignment.Center)
    .width(this.watchSize)
    .height(this.watchSize)
    .border({ color: Color.Black, width: 1 })
    .borderRadius(this.watchSize)
  }

  build() {
    NavDestination() {
      Column() {
        this.listContinents()
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .backgroundColor('#F9F8F6')
    .hideBackButton(true)
  }
}