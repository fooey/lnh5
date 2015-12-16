import React from 'react';


export const FactTable = ({
    header,
    rows,
    detailAlign = 'right',
    ...props,
}) => (
    <table className='table table-condensed table-hover table-striped fact-table'>
        <FactTableHeader
            header={header}
        />
        <FactTableBody
            header={header}
            rows={rows}
            detailAlign={detailAlign}
        >
            {props.children}
        </FactTableBody>
    </table>
);



/*
*   Header
*/

export const FactTableHeader = ({
    header,
}) => (
    (Array.isArray(header) && header.length)
        ? <thead><tr>
            {header.map(
                (columnProps, i) =>
                <FactTableHeaderColumn
                    key={i}
                    {...columnProps}
                />
            )}
        </tr></thead>
        : null
);



export const FactTableHeaderColumn = ({
    label,
    href,
}) => (
    <th className='fact-header'>
        {(href)
            ? <a href={href}>{label}</a>
            : label
        }
    </th>
);



/*
*   Body
*/

export const FactTableBody = ({
    header,
    rows,
    detailAlign,
    ...props,
}) => (
    <tbody>
        {(Array.isArray(rows) && rows.length)
            ? rows.map(
                (rowProps, i) =>
                <FactTableRow
                    key={i}
                    header={header}
                    detailAlign={detailAlign}
                    {...rowProps}
                />
            )
            : null
        }

        {props.children}
    </tbody>
);



export const FactTableRow = ({
    header,
    label,
    href,
    detail,
    detailAlign,
    title = label,
}) => (
    <tr title={title}>
        <FactTableRowLabel
            label={label}
            href={href}
        />
        {[...detail].map(
            (detailItem, i) =>
            <FactTableRowDetail
                key={i}
                header={header[i+1]}
                detail={detailItem}
                detailAlign={detailAlign}
            />
        )}
    </tr>
);



export const FactTableRowLabel = ({
    label,
    href,
}) => (
    <th
        className='fact-label'
        data-label={label}
    >
        {(href)
            ? <a href={href}>{label}</a>
            : label
        }
    </th>
);



export const FactTableRowDetail = ({
    header,
    detail,
    detailAlign,
}) => (
    <td
        className='fact-detail'
        style={{textAlign: detailAlign}}
        data-label={header.label}
    >
        {(detail !== null)
            ? detail
            : <span className='muted'>Not Available</span>
        }
    </td>
);
