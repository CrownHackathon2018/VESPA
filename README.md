# VESPA

## Crown IT Hackerthon

A Ruby on Rails Website.

## Problem statement:

‘As a Crown Tester, I want an automated process to reconfigure a VIK to point to a test environment of my choice so that I can perform this action unassisted’.

Current issue is when SQA want to test VIK code on a test VIK (VIK-01, VIK-37, VIK-66) if the environment needs to be reconfigured they will often rely on an Dev resource to configure it for them which takes time, effort, and creates a dependency on resource availability.

## Proposed Solution:

VIK

ENVIRONMENT

SELF-SERVICE

PORTAL

APPLICATION

The website creates a exe.config file that changes the connection strings of the proposed VIK unit to point to different environments.  When deployed internally, the exe.config file is then automatically pushed to a shared file locally on the VIK unit and overrights the excisting config file.  A restart of the VIK .exe is required for the changes to take effect.

Does it replace any existing solution/technology? What is the value?

Enhancement to laborious process - removes dependency on Development resource to reconfigure VIK environment if required; VESPA will easily identify which environment VIK is currently pointing too. Key value proposition is time saving; removing resource dependencies and constraints.

## Testing

This code has been tested on a MAC running ruby and rails with no errors.  It has yet to be tested on a Windows machine or Linux machine.

PowerPoint presentation detailing outcome, Adobe Spark video montage.
