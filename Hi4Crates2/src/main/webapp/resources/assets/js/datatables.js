$(function (e) {

    // basic datatable
    $('#datatable-basic').DataTable({
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
        "pageLength": 10,
        // scrollX: true
    });
    // basic datatable

// 연가

    $('#vacation-table').DataTable({
        "language": {
            "decimal":        "",
            "emptyTable":     "데이터가 없습니다.",
            "info":           "_TOTAL_ 개의 항목 중 _START_ 에서 _END_ 까지 표시",
            "infoEmpty":      "",
            "infoFiltered":   "(총 _MAX_ 개의 항목 중 검색됨)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "_MENU_ 페이지 당 항목 수",
            "loadingRecords": "로딩중...",
            "processing":     "처리중...",
            "search":         "검색:",
            "zeroRecords":    "일치하는 항목을 찾을 수 없습니다.",
            "paginate": {
                "first":      "첫 페이지",
                "last":       "마지막 페이지",
                "next":       "다음",
                "previous":   "이전"
            },
            "aria": {
                "sortAscending":  ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬"
            },
        },
        "pageLength": 10,
        // scrollX: true
    });
    
    //수술기록 테이블
    $('#surgeryRecord').DataTable({
        "language": {
            "decimal":        "",
            "emptyTable":     "데이터가 없습니다.",
            "info":           "_TOTAL_ 개의 항목 중 _START_ 에서 _END_ 까지 표시",
            "infoEmpty":      "",
            "infoFiltered":   "(총 _MAX_ 개의 항목 중 검색됨)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "_MENU_ 페이지 당 항목 수",
            "loadingRecords": "로딩중...",
            "processing":     "처리중...",
            "search":         "검색:",
            "zeroRecords":    "일치하는 항목을 찾을 수 없습니다.",
            "paginate": {
                "first":      "첫 페이지",
                "last":       "마지막 페이지",
                "next":       "다음",
                "previous":   "이전"
            },
            "aria": {
                "sortAscending":  ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬"
            },
        },
        "pageLength": 10,
        // scrollX: true
    });

    
    //문서함 테이블
    $('#documentTable').DataTable({
        "language": {
            "decimal":        "",
            "emptyTable":     "데이터가 없습니다.",
            "info":           "_TOTAL_ 개의 항목 중 _START_ 에서 _END_ 까지 표시",
            "infoEmpty":      "",
            "infoFiltered":   "(총 _MAX_ 개의 항목 중 검색됨)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "_MENU_ 페이지 당 항목 수",
            "loadingRecords": "로딩중...",
            "processing":     "처리중...",
            "search":         "검색:",
            "zeroRecords":    "일치하는 항목을 찾을 수 없습니다.",
            "paginate": {
                "first":      "첫 페이지",
                "last":       "마지막 페이지",
                "next":       "다음",
                "previous":   "이전"
            },
            "aria": {
                "sortAscending":  ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬"
            },
        },
        "pageLength": 10,
        // scrollX: true
    });











    // responsive datatable
    $('#responsiveDataTable').DataTable({
        responsive: true,
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
        "pageLength": 10,
    });
    // responsive datatable

    // responsive modal datatable
    $('#responsivemodal-DataTable').DataTable({
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal({
                    header: function (row) {
                        var data = row.data();
                        return data[0] + ' ' + data[1];
                    }
                }),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                    tableClass: 'table'
                })
            }
        },
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
        "pageLength": 10,
    });
    // responsive modal datatable

    // file export datatable
    $('#file-export').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
    });
    // file export datatable

    // delete row datatable
    var table = $('#delete-datatable').DataTable({
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        }
    });
    $('#delete-datatable tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
    $('#button').on("click", function () {
        table.row('.selected').remove().draw(false);
    });
    // delete row datatable

    // scroll vertical
    $('#scroll-vertical').DataTable({
        scrollY: '265px',
        scrollCollapse: true,
        paging: false,
        scrollX: true,
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
    });
    // scroll vertical

    // hidden columns
    $('#hidden-columns').DataTable({
        columnDefs: [
            {
                target: 2,
                visible: false,
                searchable: false,
            },
            {
                target: 3,
                visible: false,
            },
        ],
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
        "pageLength": 10,
        // scrollX: true
    });
    // hidden columns
    
    
    // add row datatable
    var t = $('#add-row').DataTable({
        
        language: {
            searchPlaceholder: 'Search...',
            sSearch: '',
        },
    });
    var counter = 1;
    $('#addRow').on('click', function () {
        t.row.add([counter + '.1', counter + '.2', counter + '.3', counter + '.4', counter + '.5']).draw(false);
        counter++;
    });
    // add row datatable

});

