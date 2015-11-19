# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require cocoon
#= require turbolinks

textareaAutoResize = ($textarea) ->
  hiddenDiv = $('.hiddendiv').first()
  if !hiddenDiv.length
    hiddenDiv = $('<div class="hiddendiv common"></div>')
    $('body').append hiddenDiv

  # Set font properties of hiddenDiv
  fontFamily = $textarea.css('font-family')
  fontSize = $textarea.css('font-size')
  if fontSize
    hiddenDiv.css 'font-size', fontSize
  if fontFamily
    hiddenDiv.css 'font-family', fontFamily
  if $textarea.attr('wrap') == 'off'
    hiddenDiv.css('overflow-wrap', 'normal').css 'white-space', 'pre'
  hiddenDiv.text $textarea.val() + '\n'
  content = hiddenDiv.html().replace(/\n/g, '<br>')
  hiddenDiv.html content
  # When textarea is hidden, width goes crazy.
  # Approximate with half of window size
  if $textarea.is(':visible')
    hiddenDiv.css 'width', $textarea.width()
  else
    hiddenDiv.css 'width', $(window).width() / 2
  $textarea.css 'height', hiddenDiv.height()
  return

cocoonInitialize = ->
  $('.fields-container').on 'cocoon:after-insert', ->
    changePageNumberFiled()
    return
  $('.fields-container').on 'cocoon:after-remove', ->
    changePageNumberFiled()
    return
  return

changePageNumberFiled = ->
  $('.nested-fields:visible').each (i, e) ->
    _this = $(e)
    _this.find('input[type="hidden"][id$="_number"]').val i + 1
    _this.find('.card-title').text "ページ #{i + 1}"
    return
  return

page_load_execution = ->
  # reinitialized

  ## wave effect
  Waves.displayEffect()

  ## cllapse
  $('.collapsible').collapsible accordion: false

  ## side navi
  $('.button-collapse').sideNav 'edge': 'left'

  ## tooltip
  $('.tooltipped').tooltip()

  ## datepicker
  $('.datepicker').pickadate(
    selectMonths: true
    selectYears: 30
    format: 'yyyy-mm-dd'
    submitFormat: 'yyyy-mm-dd'
    weekdaysFull: [
      '日曜日'
      '月曜日'
      '火曜日'
      '水曜日'
      '木曜日'
      '金曜日'
      '土曜日'
    ]
    weekdaysShort: [
      '月'
      '火'
      '水'
      '木'
      '金'
      '土'
      '日'
    ]
    monthsFull: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]
    monthsShort: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]
  )

  ## form field
  Materialize.updateTextFields()

  ## from select
  $('select').material_select();

  ## cocoon
  cocoonInitialize()

  ## textarea auto resize
  $('textarea.materialize-textarea').each ->
    textareaAutoResize $(this)
    return

  $('body').on 'keyup keydown autoresize', 'textarea.materialize-textarea', ->
    textareaAutoResize $(this)
    return

  return


ready_execution = ->
  ## side navi
  $('.button-collapse').sideNav 'edge': 'left'

  ## datepicker
  $('.datepicker').pickadate(
    selectMonths: true
    selectYears: 30
    format: 'yyyy-mm-dd'
    submitFormat: 'yyyy-mm-dd'
    weekdaysFull: [
      '日曜日'
      '月曜日'
      '火曜日'
      '水曜日'
      '木曜日'
      '金曜日'
      '土曜日'
    ]
    weekdaysShort: [
      '月'
      '火'
      '水'
      '木'
      '金'
      '土'
      '日'
    ]
    monthsFull: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]
    monthsShort: [
      '1月'
      '2月'
      '3月'
      '4月'
      '5月'
      '6月'
      '7月'
      '8月'
      '9月'
      '10月'
      '11月'
      '12月'
    ]

  )

  ## need if use datepicker
  Materialize.updateTextFields()

  ## from select
  $('select').material_select();

  ## cocoon
  cocoonInitialize()

  return


$(document).on('ready', ready_execution)
$(document).on('page:load', page_load_execution)
