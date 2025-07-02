pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  component FontFamily: QtObject {
    readonly property string sans: "Inter"
    readonly property string mono: "JetBrainsMono Nerd Font"
    readonly property string icon: "Material Symbols Rounded"
  }

  component FontSize: QtObject {
    readonly property int tiny: 8
    readonly property int smallest: 10
    readonly property int smaller: 12
    readonly property int small: 14
    readonly property int regular: 16
    readonly property int medium: 20
    readonly property int large: 24
    readonly property int larger: 28
    readonly property int largest: 32
    readonly property int huge: 40
  }

  component FontWeight: QtObject {
    readonly property int smallest: 100
    readonly property int smaller: 200
    readonly property int small: 300
    readonly property int regular: 400
    readonly property int medium: 500
    readonly property int large: 600
    readonly property int larger: 700
    readonly property int largest: 800
    readonly property int huge: 900
  }

  component FontLeading: QtObject {
    readonly property int none: 0
  }

  component FontTracking: QtObject {
    readonly property int none: 0
    readonly property int small: 2
    readonly property int regular: 4
    readonly property int medium: 6
    readonly property int large: 8
  }

  component IconFill: QtObject {
    readonly property bool filled: true
    readonly property bool outline: false
  }

  component IconSize: QtObject {
    readonly property int tiny: 12
    readonly property int smallest: 16
    readonly property int smaller: 20
    readonly property int small: 24
    readonly property int regular: 28
    readonly property int medium: 32
    readonly property int large: 40
    readonly property int larger: 48
    readonly property int largest: 56
    readonly property int huge: 64
  }

  component IconOpticalSize: QtObject {
    readonly property int regular: 28
  }

  component IconGrade: QtObject {
    readonly property int regular: 0
  }

  component SpacingGap: QtObject {
    readonly property int none: 0
    readonly property int small: 6
    readonly property int regular: 12
    readonly property int medium: 16
    readonly property int large: 32
  }

  component SpacingMargin: QtObject {
    readonly property int none: 0
    readonly property int smallest: 8
    readonly property int smaller: 12
    readonly property int small: 16
    readonly property int regular: 20
    readonly property int medium: 24
    readonly property int large: 32
    readonly property int larger: 40
    readonly property int largest: 48
  }

  component SpacingPadding: QtObject {
    readonly property int none: 0
    readonly property int smallest: 4
    readonly property int smaller: 6
    readonly property int small: 8
    readonly property int large: 12
    readonly property int larger: 16
    readonly property int largest: 24
  }

  component Font: QtObject {
    readonly property FontFamily family: FontFamily {}
    readonly property FontSize size: FontSize {}
    readonly property FontWeight weight: FontWeight {}
    readonly property FontLeading leading: FontLeading {}
    readonly property FontTracking tracking: FontTracking {}
  }

  component Icon: QtObject {
    readonly property IconFill fill: IconFill {}
    readonly property FontWeight weight: FontWeight {}
    readonly property IconGrade grade: IconGrade {}
    readonly property IconOpticalSize opticalSize: IconOpticalSize {}
    readonly property IconSize size: IconSize {}
  }

  component Rounding: QtObject {
    readonly property int none: 0
    readonly property int small: 3
    readonly property int medium: 6
    readonly property int large: 12
  }

  component Spacing: QtObject {
    readonly property SpacingGap gap: SpacingGap {}
    readonly property SpacingMargin margin: SpacingMargin {}
    readonly property SpacingPadding padding: SpacingPadding {}
  }

  readonly property Font font: Font {}
  readonly property Icon icon: Icon {}
  readonly property Rounding rounding: Rounding {}
  readonly property Spacing spacing: Spacing {}
}
