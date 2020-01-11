import React from "react"
import styled from "styled-components"

import colors from "../foundation/colors"
import shadows from "../foundation/shadows"
import textStyles from "../foundation/textStyles"

export default class TextStylesTest extends React.Component {
  render() {



    return (
      <View>
        <Text1>
          {"Text goes here"}
        </Text1>
        <Text2>
          {"Text goes here"}
        </Text2>
        <Text3>
          {"Text goes here"}
        </Text3>
        <View3>
          <Text4>
            {"Text goes here"}
          </Text4>
        </View3>
        <View1>
          <Text5>
            {"Text goes here"}
          </Text5>
        </View1>
        <View2>
          <Text6>
            {
              "Text goes here and wraps around when it reaches the end of the text field."
            }
          </Text6>
        </View2>
        <Text7>
          {"Text goes here"}
        </Text7>
        <Text8>
          {"Text goes here"}
        </Text8>
        <Text9>
          {"Text goes here"}
        </Text9>
      </View>
    );
  }
};

let View = styled.div({
  alignItems: "flex-start",
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text1 = styled.span({
  textAlign: "left",
  ...textStyles.display3,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text2 = styled.span({
  textAlign: "left",
  ...textStyles.display2,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text3 = styled.span({
  textAlign: "left",
  ...textStyles.display1,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let View3 = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  backgroundColor: colors.green50,
  display: "flex",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text4 = styled.span({
  textAlign: "left",
  ...textStyles.headline,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let View1 = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  backgroundColor: colors.green100,
  display: "flex",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text5 = styled.span({
  textAlign: "left",
  ...textStyles.subheading2,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let View2 = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  backgroundColor: colors.green200,
  display: "flex",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text6 = styled.span({
  textAlign: "left",
  ...textStyles.subheading1,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text7 = styled.span({
  textAlign: "left",
  ...textStyles.body2,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text8 = styled.span({
  textAlign: "left",
  ...textStyles.body1,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let Text9 = styled.span({
  textAlign: "left",
  ...textStyles.caption,
  alignItems: "flex-start",
  display: "block",
  flex: "0 0 auto",
  flexDirection: "column",
  justifyContent: "flex-start"
})