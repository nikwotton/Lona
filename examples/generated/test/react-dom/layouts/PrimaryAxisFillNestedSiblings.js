import React from "react"
import styled from "styled-components"

import colors from "../foundation/colors"
import shadows from "../foundation/shadows"
import textStyles from "../foundation/textStyles"
import FillWidthFitHeightCard from "./FillWidthFitHeightCard"

export default class PrimaryAxisFillNestedSiblings extends React.Component {
  render() {



    return (
      <Container>
        <Horizontal>
          <FillWidthFitHeightCard />
          <Spacer />
          <FillWidthFitHeightCard />
        </Horizontal>
      </Container>
    );
  }
};

let Container = styled.div({
  alignItems: "flex-start",
  backgroundColor: colors.teal50,
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start",
  paddingTop: "10px",
  paddingRight: "10px",
  paddingBottom: "10px",
  paddingLeft: "10px"
})

let Horizontal = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  backgroundColor: colors.teal100,
  display: "flex",
  flex: "0 0 auto",
  flexDirection: "row",
  justifyContent: "flex-start"
})

let Spacer = styled.div({
  alignItems: "flex-start",
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  width: "8px",
  height: "0px"
})