cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  chronic-tubulo-interstitial-nephritis---primary:
    run: chronic-tubulo-interstitial-nephritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  other-tubulo-interstitial-nephritis---primary:
    run: other-tubulo-interstitial-nephritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: chronic-tubulo-interstitial-nephritis---primary/output
  renal-tubulo-interstitial-nephritis---primary:
    run: renal-tubulo-interstitial-nephritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: other-tubulo-interstitial-nephritis---primary/output
  tubulo-interstitial-nephritis-disordr---primary:
    run: tubulo-interstitial-nephritis-disordr---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: renal-tubulo-interstitial-nephritis---primary/output
  tubulo-interstitial-nephritis-induced---primary:
    run: tubulo-interstitial-nephritis-induced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-disordr---primary/output
  nephropathy-tubulo-interstitial-nephritis---primary:
    run: nephropathy-tubulo-interstitial-nephritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-induced---primary/output
  tubulointerstitial---primary:
    run: tubulointerstitial---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: nephropathy-tubulo-interstitial-nephritis---primary/output
  tubulo-interstitial-nephritis-unspecified---secondary:
    run: tubulo-interstitial-nephritis-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: tubulointerstitial---primary/output
  nephropathy-tubulo-interstitial-nephritis---secondary:
    run: nephropathy-tubulo-interstitial-nephritis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-unspecified---secondary/output
  tubulo-interstitial-nephritis-substance---secondary:
    run: tubulo-interstitial-nephritis-substance---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: nephropathy-tubulo-interstitial-nephritis---secondary/output
  tubulo-interstitial-nephritis-induced---secondary:
    run: tubulo-interstitial-nephritis-induced---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-substance---secondary/output
  tubulo-interstitial-nephritis-classified---secondary:
    run: tubulo-interstitial-nephritis-classified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-induced---secondary/output
  renal-tubulo-interstitial-nephritis---secondary:
    run: renal-tubulo-interstitial-nephritis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: tubulo-interstitial-nephritis-classified---secondary/output
  other-tubulo-interstitial-nephritis---secondary:
    run: other-tubulo-interstitial-nephritis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: renal-tubulo-interstitial-nephritis---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: other-tubulo-interstitial-nephritis---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
