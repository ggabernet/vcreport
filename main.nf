#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/vcreport
========================================================================================
    Github : https://github.com/nf-core/vcreport
    Website: https://nf-co.re/vcreport
    Slack  : https://nfcore.slack.com/channels/vcreport
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { VCREPORT } from './workflows/vcreport'

//
// WORKFLOW: Run main nf-core/vcreport analysis pipeline
//
workflow NFCORE_VCREPORT {
    VCREPORT ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_VCREPORT ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
