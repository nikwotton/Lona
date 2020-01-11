import React from "react"
import { View, StyleSheet } from "react-native"

import colors from "../foundation/colors"
import shadows from "../foundation/shadows"
import textStyles from "../foundation/textStyles"

export default class BorderStyleTest extends React.Component {
  render() {


    let customBorderStyle
    let Inner$borderStyle
    let Other$borderStyle
    let View$borderStyle
    Inner$borderStyle = ""
    View$borderStyle = "dashed"

    if (this.props.showDottedBorder) {

      Inner$borderStyle = "dotted"
    }
    if (this.props.customBorderStyle != null) {

      let customBorderStyle = this.props.customBorderStyle

      View$borderStyle = customBorderStyle
    }
    Other$borderStyle = this.props.requiredBorderStyle
    return (
      <View style={[styles.view, { borderStyle: View$borderStyle }]}>
        <View style={[styles.inner, { borderStyle: Inner$borderStyle }]} />
        <View style={[styles.other, { borderStyle: Other$borderStyle }]} />
      </View>
    );
  }
};

let styles = StyleSheet.create({
  view: {
    alignItems: "flex-start",
    alignSelf: "stretch",
    flex: 0,
    flexDirection: "row",
    justifyContent: "flex-start",
    borderColor: colors.greena700,
    borderStyle: "dashed",
    borderWidth: 2
  },
  inner: {
    alignItems: "flex-start",
    backgroundColor: colors.blue50,
    flexDirection: "column",
    justifyContent: "flex-start",
    borderColor: colors.bluea700,
    borderWidth: 10,
    width: 100,
    height: 100
  },
  other: {
    alignItems: "flex-start",
    flexDirection: "column",
    justifyContent: "flex-start",
    borderColor: colors.reda700,
    borderStyle: "dotted",
    borderWidth: 4,
    width: 100,
    height: 100
  }
})