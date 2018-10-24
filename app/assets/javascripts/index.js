$(document).on('turbolinks:load', function() {
  if ($('#lists-index').length > 0) {
    var app = new Vue({
      el: '#app',
      data: {
        selectedRoad: '',
        selectedDirection: '',
        selectRoadData: ['國一', '汐止－楊梅高架', '國二', '國三', '國三甲', '國四', '國五', '國六', '國八', '國十'],
        selectDirectionData: [],
        km: '',
        selectInterchanges: [],
        interchanges: [],
        result: '',
        search: '',
        results: [],
        isOpen: false,
        isLoading: false,
        arrowCounter: -1,
        alertText: ''
      },
      methods: {
        getResult() {
          var vm = this
          if (
            vm.km < vm.selectInterchanges[vm.selectInterchanges.length - 1].km &&
            vm.km > vm.selectInterchanges[0].km
          ) {
            var _arr = vm.selectInterchanges.filter(function(item, index, array) {
              return item.name.slice(-3) !== '服務區' && item.name.slice(-3) !== '休息站'
            })
            if (vm.selectedDirection === '北上' || vm.selectedDirection === '西向') {
              var arr = _arr.filter(function(item, index, array) {
                return item.km >= vm.km && item.coordsNW !== ''
              })
              vm.result = arr[0]
              $('#list_address').val(vm.result.name)
              $('#list_latlng').val(vm.result.coordsNW)
              $('#list_address').focus()
            } else {
              var arr = _arr.filter(function(item, index, array) {
                return item.km <= vm.km && item.coordsSE !== ''
              })
              vm.result = arr[arr.length - 1]
              $('#list_address').val(vm.result.name)
              $('#list_latlng').val(vm.result.coordsSE)
              $('#list_address').focus()
            }
          } else {
            vm.alertText = '輸入公里數超過此國道範圍，' + vm.alertText
          }
        },
        showFreeway() {
          var vm = this
          if (vm.selectedRoad === '') {
            $('#freeway-alert').html('請選擇國道')
          } else {
            $('#freewayModal').modal('show')
          }
        },
        setInterChange(index, direction) {
          var vm = this
          if (direction === 'N') {
            $('#list_address')
              .val(vm.selectInterchanges[index].name)
              .focus()
            $('#list_latlng').val(vm.selectInterchanges[index].coordsNW)
            $('#freewayModal').modal('hide')
          } else {
            $('#list_address')
              .val(vm.selectInterchanges[index].name)
              .focus()
            $('#list_latlng').val(vm.selectInterchanges[index].coordsSE)
            $('#freewayModal').modal('hide')
          }
        },
        filterResults() {
          var _items = this.interchanges.map(function(item, index, array) {
            return item.name
          })
          this.results = _items.filter((item) => item.indexOf(this.search) > -1)
        },
        setResult(result) {
          var vm = this
          if (vm.results.length !== 0) {
            vm.search = result
            var _result = vm.interchanges.find(function(item) {
              return item.name === result
            })
            $('#list_address').val(_result.name)
            $('#list_latlng').val(_result.coords)
            vm.arrowCounter = -1
            vm.search = ''
            vm.isOpen = false
            $('#list_address').focus()
          }
        },
        handleClickOutside(evt) {
          let list = document.querySelector('.list-group')
          if (!list.contains(evt.target)) {
            this.isOpen = false
            this.arrowCounter = -1
          }
        },
        onArrowDown() {
          if (this.arrowCounter < this.results.length) {
            this.arrowCounter = this.arrowCounter + 1
          }
        },
        onArrowUp() {
          if (this.arrowCounter > 0) {
            this.arrowCounter = this.arrowCounter - 1
          }
        },
        onEnter() {
          var vm = this
          if (vm.isLoading && vm.isOpen) {
            vm.search = vm.results[vm.arrowCounter]
            var result = vm.interchanges.find(function(item) {
              return item.name === vm.search
            })
            $('#list_address').val(result.name)
            $('#list_latlng').val(result.coords)
            vm.arrowCounter = -1
            vm.search = ''
            vm.isOpen = false
            $('#list_address').focus()
          }
        },
        apiGetFreeway() {
          var vm = this
          axios
            .get('api/v1/freeways')
            .then(function(res) {
              vm.selectRoadData = res.data.data
            })
            .catch(function(err) {
              console.log(err)
            })
        },
        apiGetInterchange(value) {
          var vm = this
          var freeway = vm.selectRoadData.find(function(item, index, array) {
            return item.name === value
          })
          var id = freeway.id
          axios
            .get('api/v1/freeways/' + id)
            .then(function(res) {
              vm.selectInterchanges = res.data.data
              var minKm = vm.selectInterchanges[0].km
              var maxKm = vm.selectInterchanges[vm.selectInterchanges.length - 1].km
              vm.alertText = '公里數請輸入' + minKm + 'KM ～' + maxKm + 'KM'
            })
            .catch(function(err) {
              console.log(err)
            })
        },
        apiGetAllInterchanges() {
          var vm = this
          var interchangeFromApi = []
          var result = []
          var i = 0
          axios.get('api/v1/interchanges').then(function(res) {
            interchangeFromApi = res.data.data
            interchangeFromApi.forEach(function(item) {
              if (item.name.slice(-3) === '服務區' || item.name.slice(-3) === '休息站') {
                if (item.coordsNW === item.coordsSE) {
                  vm.interchanges.push({ name: item.name, coords: coords })
                } else {
                  vm.interchanges.push({ name: item.name.concat('北上'), coords: item.coordsNW })
                  vm.interchanges.push({ name: item.name.concat('南下'), coords: item.coordsSE })
                }
              } else if (item.coordsNW !== '' || item.coordsSE !== '') {
                var coords = item.coordsNW !== '' ? item.coordsNW : item.coordsSE
                vm.interchanges.push({ name: item.name, coords: coords })
              }
            })
          })
        }
      },
      computed: {
        checkAll() {
          return this.selectedRoad === '' || this.selectedDirection === '' || this.km === ''
        },
        checkFreeway() {
          return this.selectedRoad === ''
        }
      },
      watch: {
        selectedRoad(value) {
          var vm = this
          if (
            value === '國一' ||
            value === '汐止－楊梅高架' ||
            value === '國三' ||
            value === '國三甲' ||
            value === '國五'
          ) {
            vm.selectDirectionData = ['北上', '南下']
          } else {
            vm.selectDirectionData = ['東向', '西向']
          }
          vm.apiGetInterchange(value)
        },
        results() {
          var vm = this
          if (vm.results.length === 0) {
            vm.isLoading = false
          } else {
            vm.isLoading = true
          }
        },
        search() {
          if (this.search !== '') {
            this.$emit('input', this.search)
            this.filterResults()
            this.isOpen = true
          } else {
            this.isOpen = false
          }
        }
      },
      created() {
        this.apiGetFreeway()
        this.apiGetAllInterchanges()
      },
      mounted() {
        document.addEventListener('click', this.handleClickOutside)
      },
      destroyed() {
        document.removeEventListener('click', this.handleClickOutside)
      }
    })
  }
})
